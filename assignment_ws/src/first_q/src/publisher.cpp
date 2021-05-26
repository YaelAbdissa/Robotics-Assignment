#include "ros/ros.h"
#include "geometry_msgs/Point.h"
#include "first_q/my_msg.h"

#include <vector>

// struct Point {
//     float x;
//     float y;
//     float z;
// };

int main(int argc, char **argv)
{
  // ROS objects
  ros::init(argc, argv, "publisher");
  ros::NodeHandle n;
  ros::Publisher pub = n.advertise<first_q::my_msg>("my_topic", 1);
  ros::Rate loop_rate(0.5);

  // the message to be published
  first_q::my_msg msg;
  msg.another_field = 0;
  // creating the vector
  float x;
  float y;
  float z;
  float d;
  float ax;
  float ay;
  float az;
  std::cout << "Give three values for vector positions ";
  std::cout << "X: ";
  std::cin >> x;
  std::cout << "Y: ";
  std::cin >> y;
  std::cout << "Z: ";
  std::cin >> z;
  std::cout << "Give a value for translation d :";
  std::cin >> d;
  std::cout << "Give three values for angles ax:X-axis: ";
  std::cin >> ax;
  std::cout << "ay:Y-axis: ";
  std::cin >> ay;
  std::cout << "az:Z-axis: ";
  std::cin >> az;
  std::vector<float> my_vector ={x,y,z};
   
  int count = 0;
  while (ros::ok())
  {
   msg.another_field = count;
   int i = 0;
    msg.x=my_vector.at(0);
    msg.y=my_vector.at(1);
    msg.z=my_vector.at(2);
   
    ROS_INFO("Counter %d", msg.another_field);

    pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    ++count;

  }
  return 0;
}