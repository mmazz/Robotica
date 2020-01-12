#include <vector>
#include <tf/tf.h>
#include <robmovil_msgs/LandmarkArray.h>
#include <sensor_msgs/PointCloud.h>
#include "landmark_detector.h"

#define LANDMARK_DIAMETER 0.1 // metros (0.1 = 10cm)


double dist2(double x0, double y0, double x1, double y1) // funcion para sacar la norma
{ return sqrt((x1-x0)*(x1-x0) + (y1-y0)*(y1-y0));}

robmovil_ekf::LandmarkDetector::LandmarkDetector(ros::NodeHandle& _n) :
    n(_n), transform_received(false)
{
  laser_sub = n.subscribe("/robot/front_laser/scan", 1, &LandmarkDetector::on_laser_scan, this); // el enunciado pide subscribirse a este
  landmark_pub = n.advertise<robmovil_msgs::LandmarkArray>("/landmarks", 1);
  pointcloud_pub = n.advertise<sensor_msgs::PointCloud>("/landmarks_pointcloud", 1);

  listener = boost::make_shared<tf::TransformListener>();

  n.param("robot_frame", robot_frame, std::string("base_link"));
  n.param("publish_robot_frame", publish_robot_frame, std::string("base_link"));
  n.param("laser_frame", laser_frame, std::string("laser"));

  ROS_INFO_STREAM("publishing to frame " << publish_robot_frame);
}

void robmovil_ekf::LandmarkDetector::on_laser_scan(const sensor_msgs::LaserScanConstPtr& msg)
{
  if(!update_laser_tf(msg->header.stamp)){
    ROS_WARN_STREAM(laser_frame << " -> " << robot_frame << " transform not yet received, not publishing landmarks");
    return;
  }

  /* COMPLETAR: Convertir range,bearing a puntos cartesianos x,y,0.
   * Descartando aquellas mediciones por fuera de los rangos validos */
  std::vector<tf::Vector3> cartesian;
  
  for (int i = 0; i < msg->ranges.size(); i++)
  {
    /* Utilizar la informacion del mensaje para filtrar y convertir */
    float range = msg->ranges[i];
    float range_min = msg->range_min;
    float range_max = msg->range_max;

    if (range <= range_min or range >= range_max) { //filtro  las mediciones invalidas
    	continue;
    }

    float angle_min = msg->angle_min;
    float angle_increment = msg->angle_increment;

    float angle_current = angle_min + angle_increment * i; //supongo que el angulo increment es la diferencia entre el angulo maximo y el minimo dividido la cantidad de pasos
                                                           // y es basicamente el angulo actual
    float x = range * cos(angle_current); // me paso a cartensianas
    float y = range * sin(angle_current); 


    /* COMPLETAR: p debe definirse con informacion valida y 
     * en coordenadas cartesianas */
    tf::Vector3 p;
    p.setX(x);
    p.setY(y);
    p.setZ(0);
    
    /* convierto el punto en relacion al marco de referencia del laser al marco del robot */
    p = laser_transform * p;

    cartesian.push_back(p); // cartesian son ya los postes por que si mide la nada es mayor al rango maximo y lo descarto
  }

  /* Mensaje del arreglo de landmarks detectados */
  robmovil_msgs::LandmarkArray landmark_array;
  landmark_array.header.stamp = msg->header.stamp;
  landmark_array.header.frame_id = publish_robot_frame;
  
  /* VECTORES AUXILIARES: Pueden utilizar landmark_points para ir acumulando
   * mediciones cercanas */
  std::vector<tf::Vector3> landmark_points;
  
  // centroides estimados de los postes en coordenadas cartesianas
  std::vector<tf::Vector3> centroids;
  
  for (int i = 0; i < cartesian.size(); i++)
  {
    
    /* COMPLETAR: Acumular, de manera secuencial, mediciones cercanas (distancia euclidea) */
    
    if(landmark_points.empty()){ //asd
      landmark_points.push_back(cartesian[i]);
      continue;
    }
    
    if (i != cartesian.size()-1 && dist2(cartesian[i].getX(), cartesian[i].getY(), landmark_points[0].getX(), landmark_points[0].getY()) < LANDMARK_DIAMETER)
      landmark_points.push_back(cartesian[i]);  // Comparo la distancia entre landmarks y veo que no sea mayor al diametro de los postes, ya que ese dato magicamente lo se. 
                                                //si se cumple no hago nada y paso al proximo punto y lo comparo de nuevo con el primer landmark
    

    else {    //si no se cumple el if es por que ya estoy en un nuevo poste, entocnes voy a agarrar todos esos puntos de un poste y me armo el centroid

    /* Al terminarse las mediciones provenientes al landmark que se venia detectando,
     * se calcula la pose del landmark como el centroide de las mediciones */
     
    ROS_INFO_STREAM("landmark con " << landmark_points.size() << " puntos");
    
    tf::Vector3 centroid(0,0,0);

    /* COMPLETAR: calcular el centroide de los puntos acumulados */

      for (int j = 0; j < landmark_points.size(); j++) { // hago un promedio de las poses
        centroid += landmark_points[j];
      }

      centroid = centroid / landmark_points.size(); // promedio....


    ROS_INFO_STREAM("landmark detectado (cartesianas): " << centroid.getX() << " " << centroid.getY() << " " << centroid.getZ());
    centroids.push_back(centroid);

    /* Convertir el centroide a coordenadas polares, construyendo el mensaje requerido */
    robmovil_msgs::Landmark landmark;
    
    float r = sqrt(centroid.getX() * centroid.getX() + centroid.getY() * centroid.getY()); // distancia desde el robot al centroide,sale de la teorica
    landmark.range = r;
    
    float a = atan2(centroid.getY(), centroid.getX()); // angulo de la recta que conecta al robot con el centroide, sale de la teorica
    landmark.bearing = a;

    /* se agrega el landmark en coordenadas polares */
    landmark_array.landmarks.push_back(landmark);
    ROS_INFO_STREAM("landmark detectado (polares): " << i << ": " << landmark.range << " " << landmark.bearing);

    /* empiezo a procesar un nuevo landmark */
    landmark_points.clear();
    landmark_points.push_back(cartesian[i]);//Ya que este landmark es el que hizo venir al else ya que es parte de otro poste, entonces me guardo este punto
             
                                            // ya que es el primer punto del "nuevo" postee  }
}
}

  /* Publicamos el mensaje de los landmarks encontrados */
  if (!landmark_array.landmarks.empty()){
    landmark_pub.publish(landmark_array);
    publish_pointcloud(landmark_array.header, centroids);
  }
}

bool robmovil_ekf::LandmarkDetector::update_laser_tf(const ros::Time& required_time)
{
  if (!listener->waitForTransform(robot_frame, laser_frame, required_time, ros::Duration(1)))
    return false;
  else
  {
    listener->lookupTransform(robot_frame, laser_frame, ros::Time(0), laser_transform);
    return true;
  }
}

void robmovil_ekf::LandmarkDetector::publish_pointcloud(const std_msgs::Header& header, const std::vector<tf::Vector3>& landmark_positions)
{
  sensor_msgs::PointCloud pointcloud;
  pointcloud.header.stamp = header.stamp;
  pointcloud.header.frame_id = header.frame_id;

  for (int i = 0; i < landmark_positions.size(); i++)
  {
    geometry_msgs::Point32 point;
    point.x = landmark_positions[i].getX();
    point.y = landmark_positions[i].getY();
    point.z = landmark_positions[i].getZ();
    pointcloud.points.push_back(point);
  }
  pointcloud_pub.publish(pointcloud);
}

