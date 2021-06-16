#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include <iostream>
#include <sstream>
#include "std_msgs/Float64.h"
#include "ros/ros.h"
#include "arm_lib/jointAngles.h"
namespace gazebo
{
	class ModelPush : public ModelPlugin
	{
	public:
		void Load(physics::ModelPtr _parent, sdf::ElementPtr /*_sdf*/)
		{
			// Store the pointer to the model
			this->model = _parent; // sdf model

			// // intiantiate the joint controller
			this->jointController = this->model->GetJointController();

			// // set your PID values
			this->pid = common::PID(800, 200, 100);
			
			// base_arm1_joint
			std::string base_arm1 = this->model->GetJoint("base_arm1_joint")->GetScopedName();
			this->jointController->SetPositionPID(base_arm1, pid);

			// arm1_arm2_joint
			std::string arm1_arm2 = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			this->jointController->SetPositionPID(arm1_arm2, pid);

			// arm2_arm3_joint
			std::string arm2_arm3 = this->model->GetJoint("arm2_arm3_joint")->GetScopedName();
			this->jointController->SetPositionPID(arm2_arm3, pid);

			// arm3_arm4_joint
			std::string arm3_arm4 = this->model->GetJoint("arm3_arm4_joint")->GetScopedName();
			this->jointController->SetPositionPID(arm3_arm4, pid);

			std::string arm4_palm = this->model->GetJoint("palm_arm4")->GetScopedName();
			this->jointController->SetPositionPID(arm4_palm, pid);

			int argc = 0;
			char **argv = NULL;
			ros::init(argc, argv, "talker");

			ros::NodeHandle n;
			this->pub = n.advertise<arm_lib::jointAngles>("chatter", 1000);

			ros::NodeHandle n_;
			this->sub = n_.subscribe("chatter", 1000, &ModelPush::updateJoint, this);

			this->updateConnection = event::Events::ConnectWorldUpdateBegin(
				std::bind(&ModelPush::OnUpdate, this));
		}

	public:
		void OnUpdate()
		{	
			// double a1 = physics::JointState(this->model->GetJoint("base_arm1_joint")).Position(0);
			// double a2 = physics::JointState(this->model->GetJoint("arm1_arm2_joint")).Position(0);
			// double a3 = physics::JointState(this->model->GetJoint("arm2_arm3_joint")).Position(0);
			// double a4 = physics::JointState(this->model->GetJoint("arm3_arm4_joint")).Position(0);
			//publish(a1 * 180.0 / M_PI , a2 * 180.0 / M_PI, a3 * 180.0 / M_PI , a4 * 180.0 / M_PI);
		}

		
		void updateJoint(const arm_lib::jointAngles &msg){
			this->updateJoints(msg.joint1, msg.joint2, msg.joint3, msg.joint4);
		}

		void updateJoints(double joint1, double joint2, double joint3, double joint4){

			ROS_INFO("%f %f %f %f", joint1,joint2,joint3,joint4);

			std::string base_arm1 = this->model->GetJoint("base_arm1_joint")->GetScopedName();
			std::string arm1_arm2 = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			std::string arm2_arm3 = this->model->GetJoint("arm2_arm3_joint")->GetScopedName();
			std::string arm3_arm4 = this->model->GetJoint("arm3_arm4_joint")->GetScopedName();

			joint1 = joint1 * M_PI/ 180.0;
			joint2 = joint2 * M_PI/ 180.0;
			joint3 = joint3 * M_PI/ 180.0;
			joint4 = joint4 * M_PI/ 180.0;

			ROS_INFO("%f %f %f %f\n\n", joint1,joint2,joint3,joint4);
			

			this->jointController->SetPositionTarget(base_arm1, joint1);

			this->jointController->SetPositionTarget(arm1_arm2, joint2);

			this->jointController->SetPositionTarget(arm2_arm3, joint3);

			this->jointController->SetPositionTarget(arm3_arm4, joint4);


		}

		void publish(double joint1, double joint2, double joint3, double joint4)
		{
			arm_lib::jointAngles angle;
			angle.joint1 = joint1;
			angle.joint2 = joint2;
			angle.joint3 = joint3; 
			angle.joint4 = joint4;

			(this->pub).publish(angle);

			ros::spinOnce();
		}

	private:
		physics::ModelPtr model;

	private:
		physics::JointControllerPtr jointController;

	private:
		event::ConnectionPtr updateConnection;

		// PID object
	private:
		common::PID pid;

	private:
		ros::Publisher pub;
		ros::Subscriber sub;
	};

	// Register this plugin with the simulator
	GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}