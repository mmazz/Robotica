#include <fstream>
#include <ros/ros.h>
#include <tf2/utils.h>
#include <nav_msgs/Odometry.h>
#include <boost/date_time/posix_time/posix_time.hpp>

std::string formatTime(const boost::posix_time::ptime& time, const char* format)
{
  boost::posix_time::time_facet* facet = new boost::posix_time::time_facet();
  facet->format( format );

  std::stringstream stream;
  stream.str("");
  stream.imbue(std::locale(std::locale::classic(), facet));
  stream << time;

  return stream.str();
}

std::string timestamp()
{
  return formatTime(boost::posix_time::second_clock::local_time(), "%Y-%m-%d_%H:%M:%S");
}

class Logger
{
  public:

    Logger(ros::NodeHandle& nh);

  private:

    ros::Subscriber robot_pose_sub_, ground_truth_sub_, goal_poses_sub_,vel_control_position_sub,base_link_ekf_sub_;

    std::ofstream robot_logfile_, ground_truth_logfile_, goal_poses_logfile_, vel_control_logfile_,base_link_ekf_pose_logfile_ ;

  // funciones auxiliares

    void handleRobotPose(const nav_msgs::Odometry& msg);

    void handleGroundTruthPose(const nav_msgs::Odometry& msg);

    void handleGoalPose(const geometry_msgs::PoseStamped& msg);

    void handleVelControl(const nav_msgs::Odometry& msg);

    void handleEKFPose(const nav_msgs::Odometry& msg);

};

Logger::Logger(ros::NodeHandle& nh)
  : robot_logfile_( timestamp() + "_poses.log" ), ground_truth_logfile_( timestamp() + "_ground-truth.log" ),
    goal_poses_logfile_( timestamp() + "_goals.log" ), vel_control_logfile_( timestamp() + "_vel-control.log" ),
    base_link_ekf_pose_logfile_(timestamp() + "_base_link_ekf_pose.log")
{
  robot_pose_sub_ = nh.subscribe("/robot/odometry", 1, &Logger::handleRobotPose, this);

  ground_truth_sub_ = nh.subscribe("/robot/ground_truth", 1, &Logger::handleGroundTruthPose, this);

  goal_poses_sub_ = nh.subscribe("/goal_pose", 1, &Logger::handleGoalPose, this);

  vel_control_position_sub = nh.subscribe("/robot/vel_control", 1,&Logger::handleVelControl, this);

  base_link_ekf_sub_ = nh.subscribe("/robot/base_link_ekf_pose",1,&Logger::handleEKFPose,this);

}
void Logger::handleEKFPose(const nav_msgs::Odometry& msg)
{
  base_link_ekf_pose_logfile_ << msg.header.stamp.toSec() << " " << msg.pose.pose.position.x << " " << msg.pose.pose.position.y << " " << std::endl;
}
void Logger::handleRobotPose(const nav_msgs::Odometry& msg)
{
  robot_logfile_ << msg.header.stamp.toSec() << " " << msg.pose.pose.position.x << " " << msg.pose.pose.position.y << " " << tf2::getYaw( msg.pose.pose.orientation )
   << " " << msg.twist.twist.linear.x << " " <<msg.twist.twist.linear.y << " "<< msg.twist.twist.angular.z <<  std::endl;
}

void Logger::handleGroundTruthPose(const nav_msgs::Odometry& msg)
{
  ground_truth_logfile_ << msg.header.stamp.toSec() << " " << msg.pose.pose.position.x << " " << msg.pose.pose.position.y << " "
   << tf2::getYaw( msg.pose.pose.orientation ) << " " << msg.twist.twist.linear.x << " " << msg.twist.twist.linear.y  << std::endl;
}

void Logger::handleGoalPose(const geometry_msgs::PoseStamped& msg)
{
  goal_poses_logfile_ << msg.header.stamp.toSec() << " " << msg.pose.position.x << " " << msg.pose.position.y << " " << tf2::getYaw( msg.pose.orientation ) << std::endl;
}
void Logger::handleVelControl(const nav_msgs::Odometry& msg)
{
  vel_control_logfile_ << msg.header.stamp.toSec() <<  " " << msg.twist.twist.linear.x << " " <<msg.twist.twist.linear.y << " "<< msg.twist.twist.angular.z  << std::endl;
}
int main(int argc, char** argv)
{
  ros::init(argc, argv, "logger");
  ros::NodeHandle nh;

  Logger logger( nh );

  ros::spin();

  return 0;
}
