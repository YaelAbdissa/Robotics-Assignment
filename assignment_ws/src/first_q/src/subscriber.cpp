#include "ros/ros.h"
#include "first_q/my_msg.h"

void clbk(const first_q::my_msg::ConstPtr& msg) {
    ROS_INFO("%d", msg->another_field);
    ROS_INFO("x=%.2f, y=%.2f, z=%.2f", msg->x, msg->y,msg->z);
}

int main(int argc, char **argv)
{
  // ROS objects
  ros::init(argc, argv, "subscriber");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("my_topic", 1, clbk);

  ros::spin();

}