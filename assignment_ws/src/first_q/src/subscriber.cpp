#include "ros/ros.h"
#include "first_q/my_msg.h"

void clbk(const first_q::my_msg::ConstPtr& msg) {
    ROS_INFO("The input vector is %f %f %f The output vector after rotation by %f degree along x-axis ,Followed by rotation by %f degree along y-axis ,Followed by rotation by %f degree along z-axis and followed by translation by %f along the three axis is %f, %f, %f", msg->x, msg->y,msg->z,msg->ax, msg->ay,msg->az,msg->d,msg->a,msg->b,msg->c);
   
}

int main(int argc, char **argv)
{
  // ROS objects
  ros::init(argc, argv, "subscriber");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("my_topic", 1, clbk);

  ros::spin();

}