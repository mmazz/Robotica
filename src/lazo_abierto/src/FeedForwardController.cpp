#include <lazo_abierto/FeedForwardController.h>

FeedForwardController::FeedForwardController(ros::NodeHandle& nh) :
  TrajectoryFollower(nh)
{}

double lineal_interp(const ros::Time& t0, const ros::Time& t1, double v0, double v1, const ros::Time& t)
{
  /** COMPLETAR: esta funcion debe interpolar entre las velocidades requeridas.
   * entre v0 y v1 dependiendo el tiempo trancurrido entre ambos
   * considerar que t siempre se encuentra en t0 y t1. */
  return v0 + (t - t0).toSec() * (v1 - v0) / (t1 - t0).toSec(); // como un taylor
}

bool FeedForwardController::control(const ros::Time& t, double& v_x, double& v_y, double& w)
{
  size_t next_point_idx;

  /* Cuando la trayectoria se termina se devuelve false */
  if( not nextPointIndex(t, next_point_idx ) )
    return false;

  ROS_INFO_STREAM("processing index: " << next_point_idx);

  /* se obtienen los puntos de la trayectoria mas proximos en tiempo (el punto anteriormente transitado y el proximo a alcanzar) */
  const robmovil_msgs::TrajectoryPoint& prev_point = getTrajectory().points[ next_point_idx-1 ];
  const robmovil_msgs::TrajectoryPoint& next_point = getTrajectory().points[ next_point_idx ];

  /* tiempos requeridos para cada uno de los puntos (se debe alcanzar el siguiente punto en el tiempo t1) */
  const ros::Time& t0 = getInitialTime() + prev_point.time_from_start;
  const ros::Time& t1 = getInitialTime() + next_point.time_from_start;

  assert(t0 <= t);
  assert(t < t1);

  /* velocidades lineales en X notificadas por la trayectoria en ambos puntos. */
  double vx0 = prev_point.velocity.linear.x;
  double vx1 = next_point.velocity.linear.x;

  /* velocidades lineales en Y notificadas por la trayectoria en ambos puntos. */
  double vy0 = prev_point.velocity.linear.y;
  double vy1 = next_point.velocity.linear.y;

  /* velocidades angulares notificadas por la trayectoria en ambos puntos*/
  double va0 = prev_point.velocity.angular.z;
  double va1 = next_point.velocity.angular.z;

  //ROS_INFO_STREAM("inter: " << t0 << " " << t1 << " " << vx0 << " " << vx1 << " " << va0 << " " << vx1 << " " << t);

  /* realizar una interpolacion entre las velocidades requeridas */
  double vx = lineal_interp(t0, t1, vx0, vx1, t); // calculo de la velocidad lineal en X
  double vy = lineal_interp(t0, t1, vy0, vy1, t); // calculo de la velocidad lineal en Y
  double va = lineal_interp(t0, t1, va0, va1, t); // calculo de la velocidad angular

  /** COMPLETAR: Evaluar las velocidades lineales y angulares resultantes para publicar
   * como comandos de velocidad. */
  v_x = vx;//Cuentita de la teorica para este caso
  v_y = vy;
  w = va;

  return true;
}
