#pragma once

#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <robmovil_msgs/MultiEncoderTicks.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <math.h>

namespace robmovil
{

class PioneerOdometry
{
  public:

    PioneerOdometry(ros::NodeHandle& nh);

    void on_velocity_cmd(const geometry_msgs::Twist& twist);

    void on_encoder_ticks(const robmovil_msgs::MultiEncoderTicks& encoder);

  private:

    ros::NodeHandle& nh_;

    ros::Subscriber twist_sub_, encoder_sub_;

    ros::Publisher vel_pub_front_left_, vel_pub_front_right_, vel_pub_rear_left_, vel_pub_rear_right_, pub_odometry_;


    bool getCurrentPose(const ros::Time& t, double& x, double& y, double& a);

    

  // Acá pueden agregar las variables de instancia que necesiten

    double x_, y_, theta_;
    double v_x, v_y, w_z;
    double w_1, w_2, w_3, w_4;
    double d_l, d_r, d, delta_x, delta_y, delta_theta;

    bool ticks_initialized_;
    int32_t last_ticks_front_left_, last_ticks_front_right_, last_ticks_rear_left_, last_ticks_rear_right_;
    ros::Time last_ticks_time;

    boost::shared_ptr<tf::TransformBroadcaster> tf_broadcaster;
};

}
