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

			std::string arm4_arm5 = this->model->GetJoint("arm4_arm5")->GetScopedName();
			this->jointController->SetPositionPID(arm4_arm5, pid);

			this->pid_g common::PID(100, 200, 100);
			jointController->SetPositionPID(model->GetJoint("arm6_arm7_joint")->GetScopedName(), this->pid_g);
			jointController->SetPositionPID(model->GetJoint("arm6_arm8_joint")->GetScopedName(), this->pid_g);

			int argc = 0;
			char **argv = NULL;
			ros::init(argc, argv, "grip_control");

			sub = n.subscribe("/positions", 1000, &ModelPush::positionsCallback, this);

			fkClient = n.serviceClient<arm_lib::Fk>("fk");
			ikClient = n.serviceClient<arm_lib::Ik>("ik");

			ros::spinOnce();
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

		void GetFk(double a1, double a2, double a3, double a4, double a5, double a6)
		{
			arm_lib::Fk srv;
			srv.request.link_lengths = {0.05, 2, 1, 0.5, 0.02, 0.02};
			srv.request.joint_positions = {a1, a2, a3, a4, a5, a6};

			if (fkClient.call(srv))
			{
				ROS_INFO("Fk: [%f, %f, %f]", srv.response.position[0], srv.response.position[1], srv.response.position[2]);
			}
			else
			{
				ROS_ERROR("Failed to call service fk");
			}
		}

		public:
		void positionsCallback(const arm_lib::positions &msg)
		{
			ROS_INFO("Received %f %f %f", msg.x, msg.y, msg.z);

			arm_lib::Ik srv;
			srv.request.link_lengths = {0.15, 2, 1, 0.5, 0.02, 0.02};
			srv.request.joint_positions = {0, 0, 0, 0, 0, 0};
			srv.request.positions = {msg.x, msg.y, msg.z};

			for (int i = 0; i < jointList.size() - 4; i++)
			{
				srv.request.joint_positions[i] = physics::JointState(jointList[i]).Position(0);
			}

			if (ikClient.call(srv))
			{				
				ROS_INFO("Ik: [%f, %f, %f, %f, %f, %f]", srv.response.target_positions[0], srv.response.target_positions[1], srv.response.target_positions[2], srv.response.target_positions[3], srv.response.target_positions[4], srv.response.target_positions[5]);

				for (int i = 0; i < jointList.size() - 4; i++)
				{
					jointController->SetPositionTarget(jointList[i]->GetScopedName(), srv.response.target_positions[i]);
				}
			}
			else
			{
				ROS_ERROR("Failed to call service ik");
			}
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
		common::PID pid_g;

	private:
		physics::Joint_V jointList;

	private:
		ros::Subscriber sub;

	private:
		ros::NodeHandle n;

	private:
		ros::ServiceClient fkClient;

	private: 
		ros::ServiceClient ikClient;
	};

	// Register this plugin with the simulator
	GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}