#include <vector>
#include <numeric>      // std::accumulate
#include "imu_calibrator.h"

#define DO_CALIBRATION 1

robmovil_ekf::IMUCalibrator::IMUCalibrator(ros::NodeHandle& _n) : n(_n)
{
  imu_sub = n.subscribe("/imu", 1, &IMUCalibrator::on_imu_measurement, this);
  imu_calib_pub = n.advertise<sensor_msgs::Imu>("/imu_calib", 1);
  
  ros::NodeHandle nhp("~");
  int calibrating_time;
  nhp.param<int>("calibrate", calibrating_time, 0);

  if(calibrating_time){
    while( (ros::Time::now()) == ros::Time(0) ); // se espera hasta recibir el primer '/clock'
    timer_ = n.createTimer(ros::Duration(calibrating_time), &IMUCalibrator::calculate_bias, this, true);
    is_calibrating_ = true; // comenzar calibracion
  }else
    is_calibrating_ = false;
  
  bias_ = tf::Vector3(0,0,0); // vino deifnido dos veces... Como que lo inicializa aca? por que ya esta en el .h
  orientacion_estimada_ = tf::createIdentityQuaternion();
}

void robmovil_ekf::IMUCalibrator::calculate_bias(const ros::TimerEvent& event){
  is_calibrating_ = false;
  
  // COMPLETAR: Deben calcular el bias de las mediciones acumuladas durante el tiempo de calibracion
  bias_ = tf::Vector3(0,0,0); //defino al bias como un vector, x,y,z

    for(int i = 0; i < calibration_data_.size(); i++) {  //ya tengo las mediciones entonces las sumo todas y las divido por la cantidad de kediciones--- un promedio..
    bias_ = bias_ + calibration_data_[i];
  }

  bias_ = bias_ / calibration_data_.size();
  
  ROS_INFO_STREAM("bias: " << " " << bias_.getX() << " " << bias_.getY() << " " << bias_.getZ());
}

void robmovil_ekf::IMUCalibrator::on_imu_measurement(const sensor_msgs::Imu& msg)
{
  // Covertimos la velocidad angular del mensaje al tipo tf::Vector3
  tf::Vector3 angular_velocity;
  tf::vector3MsgToTF(msg.angular_velocity, angular_velocity);
  
  // delta de tiempo entre mediciones
  double delta_t = (msg.header.stamp - time_last_measure_).toSec();
  time_last_measure_ = msg.header.stamp;

  if ( is_calibrating_ ) {
    ROS_INFO_ONCE("Calibrando IMU..");
    
    /* COMPLETAR: Se deben acumular las mediciones de imu para calcular el bias (la media).
     * Pueden utilizar la variable globar calibration_data_ definida en el .h */

      calibration_data_.push_back(angular_velocity);// meto las velocidades angulares en el vector calibration data

  } else { // si termino el tiempo de calibracion:
    
    // construimos el mensaje nuevo
    sensor_msgs::Imu imu_calib_msg;
    imu_calib_msg = msg;
    
    // COMPLETAR: Corregir la velocidad angular recibida utilizando el bias calculado
    tf::Vector3 vel_sin_bias = angular_velocity - bias_; // a la medicion real le saco el bias dejandome asi la "verdadera" vel angular
    
    ROS_INFO_STREAM("vel: " << vel_sin_bias.getZ());
    
    // COMPLETAR: Integrar la velocidad angular corregida durante un intervalo de tiempo
    orientacion_estimada_ *= tf::createQuaternionFromYaw(delta_t*vel_sin_bias.getZ());// Por la teorica estimo la orientacion.
    orientacion_estimada_.normalize();
    
    /* Publicacion de las mediciones calibradas */
    tf::vector3TFToMsg(vel_sin_bias, imu_calib_msg.angular_velocity);
    tf::quaternionTFToMsg(orientacion_estimada_, imu_calib_msg.orientation);
    imu_calib_pub.publish(imu_calib_msg);
    
  }
}
