#include "ros/ros.h"
#include "cmath"
#include "geometry_msgs/Point.h"
#include "first_q/my_msg.h"
#include <vector>
using namespace std;
int main(int argc, char **argv)
{
  // ROS objects
  ros::init(argc, argv, "publisher");
  ros::NodeHandle n;
  ros::Publisher pub = n.advertise<first_q::my_msg>("my_topic", 1);
  ros::Rate loop_rate(0.5);

  // the message to be published
  first_q::my_msg msg;
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
  std::cout << "Give three values for angles  "<<endl;
  std::cout << "ax:X-axis: ";
  std::cin >> ax;
  std::cout << "ay:Y-axis: ";
  std::cin >> ay;
  std::cout << "az:Z-axis: ";
  std::cin >> az;
  std::vector<float> inVector ={x,y,z};
  float inVectorMatrix[3][1];
  inVectorMatrix[1][1]=inVector.at(0);
  inVectorMatrix[2][1]=inVector.at(1);
  inVectorMatrix[3][1]=inVector.at(2);
  float xRotationMatrix[3][3];
  float yRotationMatrix[3][3];
  float zRotationMatrix[3][3];
  cout<<"Rotation along X axis by : " << ax << " degree is"<<endl;
  ax = ax*3.14159/180;
  ay = ay*3.14159/180;
  az = az*3.14159/180;
  xRotationMatrix[0][0]=1;
  xRotationMatrix[0][1]=0;
  xRotationMatrix[0][2]=0;
  xRotationMatrix[1][0]=0;
  xRotationMatrix[1][1]=cos(ax);
  xRotationMatrix[1][2]=-sin(ax);
  xRotationMatrix[2][0]=0;
  xRotationMatrix[2][1]=sin(ax);
  xRotationMatrix[2][2]=cos(ax);
  //number of rows of inVector and xRotationMatrix
  int r1=3,r2=3,c1=3,c2=1, i, j, k;
  float product_X[3][1];
  for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j) {
         product_X[i][j] = 0;
      }
      for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j)
      for(k=0; k<c1; ++k) {
         product_X[i][j]+=xRotationMatrix[i][k]*inVectorMatrix[k][j];
      }
      
      for(i=0; i<r1; ++i) {
         for(j=0; j<c2; ++j)
         cout<<product_X[i][j]<<" ";
         cout<<endl;
      }
      cout<<"Followed by Rotation along y axis by : " << ay*180/3.14159<< " degree is"<<endl;

  yRotationMatrix[0][0]=cos(ay);
  yRotationMatrix[0][1]=0;
  yRotationMatrix[0][2]=sin(ay);
  yRotationMatrix[1][0]=0;
  yRotationMatrix[1][1]=1;
  yRotationMatrix[1][2]=0;
  yRotationMatrix[2][0]=-sin(ay);
  yRotationMatrix[2][1]=0;
  yRotationMatrix[2][2]=cos(ay);

  float product_Y[3][1];
  for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j) {
         product_Y[i][j] = 0;
      }
      for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j)
      for(k=0; k<c1; ++k) {
         product_Y[i][j]+=yRotationMatrix[i][k]*product_X[k][j];
      }
      
      for(i=0; i<r1; ++i) {
         for(j=0; j<c2; ++j)
         cout<<product_Y[i][j]<<" ";
         cout<<endl;
      }
         cout<<"Followed by Rotation along z axis by : " << az*180/3.14159<< " degree is"<<endl;

  zRotationMatrix[0][0]=cos(az);
  zRotationMatrix[0][1]=-sin(az);
  zRotationMatrix[0][2]=0;
  zRotationMatrix[1][0]=sin(az);
  zRotationMatrix[1][1]=cos(az);
  zRotationMatrix[1][2]=0;
  zRotationMatrix[2][0]=0;
  zRotationMatrix[2][1]=0;
  zRotationMatrix[2][2]=1;

  float product_Z[3][1];
  for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j) {
         product_Z[i][j] = 0;
      }
      for(i=0; i<r1; ++i)
      for(j=0; j<c2; ++j)
      for(k=0; k<c1; ++k) {
         product_Z[i][j]+=zRotationMatrix[i][k]*product_Y[k][j];
      }
      
      for(i=0; i<r1; ++i) {
         for(j=0; j<c2; ++j)
         cout<<product_Z[i][j]<<" ";
         cout<<endl;
      }
    float outVector[3][1];
    outVector[0][0]=product_Z[0][0]+d;
    outVector[1][0]=product_Z[1][0]+d;
    outVector[2][0]=product_Z[2][0]+d;
    cout<<"Followed by Translation along the three axis by : " << d << "  is"<<endl;
    cout<<outVector[0][0]<<endl;
    cout<<outVector[1][0]<<endl;
    cout<<outVector[2][0]<<endl;
    while (ros::ok()){
    msg.x=inVector.at(0);
    msg.y=inVector.at(1);
    msg.z=inVector.at(2);
    msg.ax=ax*180/3.14159;
    msg.ay=ay*180/3.14159;
    msg.az=az*180/3.14159;
    msg.d=d;
    msg.a=outVector[0][0];
    msg.b=outVector[1][0];
    msg.c=outVector[2][0];
   
    pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
    }
  
  return 0;
}