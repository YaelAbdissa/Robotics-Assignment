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

			this->pid_g = common::PID(100, 200, 100);
			jointController->SetPositionPID(model->GetJoint("arm6_arm7_joint")->GetScopedName(), this->pid_g);
			jointController->SetPositionPID(model->GetJoint("arm6_arm8_joint")->GetScopedName(), this->pid_g);

			int argc = 0;
			char **argv = NULL;
			ros::init(argc, argv, "grip_control");

			//sub = n.subscribe("/positions", 1000, &ModelPush::positionsCallback, this);

			// fkClient = n.serviceClient<arm_lib::Fk>("fk");
			// ikClient = n.serviceClient<arm_lib::Ik>("ik");

			ros::spinOnce();
		}

	public:
		void OnUpdate()
		{	
			double a1 = physics::JointState(this->model->GetJoint("base_arm1_joint")).Position(0);
			double a2 = physics::JointState(this->model->GetJoint("arm1_arm2_joint")).Position(0);
			double a3 = physics::JointState(this->model->GetJoint("arm2_arm3_joint")).Position(0);
			double a4 = physics::JointState(this->model->GetJoint("arm3_arm4_joint")).Position(0);
			double a5 = physics::JointState(this->model->GetJoint("arm4_arm5_joint")).Position(0);
			double a6 = physics::JointState(this->model->GetJoint("arm5_palm_joint")).Position(0);

			//GetFk(a1, a2, a3, a4, a5, a6);

			ros::spinOnce();
		}

		// void GetFk(double a1, double a2, double a3, double a4, double a5, double a6)
		// {
		// 	arm_lib::Fk srv;
		// 	srv.request.link_lengths = {0.05, 2, 1, 0.5, 0.02, 0.02};
		// 	srv.request.joint_positions = {a1, a2, a3, a4, a5, a6};

		// 	if (fkClient.call(srv))
		// 	{
		// 		ROS_INFO("Fk: [%f, %f, %f]", srv.response.position[0], srv.response.position[1], srv.response.position[2]);
		// 	}
		// 	else
		// 	{
		// 		ROS_ERROR("Failed to call service fk");
		// 	}
		// }

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