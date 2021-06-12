#include <functional>
#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <ignition/math/Vector3.hh>
#include <iostream>
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
			this->pid = common::PID(30.1, 10.01, 10.03);

			auto joint_name = "arm1_arm2_joint";
			
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

			this->updateConnection = event::Events::ConnectWorldUpdateBegin(
				std::bind(&ModelPush::OnUpdate, this));
		}

	public:
		void OnUpdate()
		{
			// float angleDegree = -90;
			// float rad = M_PI * angleDegree / 180;

			// std::string name = this->model->GetJoint("arm1_arm2_joint")->GetScopedName();
			// std::string name1 = this->model->GetJoint("arm2_arm3_joint")->GetScopedName();
			// std::string name2 = this->model->GetJoint("arm3_arm4_joint")->GetScopedName();
			
			// If the Joint has only Z axis for rotation, 0 returns that value and 1 and 2 return nan
			// double a1 = physics::JointState(this->model->GetJoint("arm1_arm2_joint")).Position(0);
			// double a2 = this->model->GetJoint("base_arm1_joint").Position(0);
			// double a3 = physics::JointState(this->model->GetJoint("arm2_arm3_joint")).Position(0);
			// double a4 = physics::JointState(this->model->GetJoint("arm3_arm4_joint")).Position(0);
			// std::cout << "Current arm1_arm2_joint values: " << a1 * 180.0 / M_PI << std::endl;
			// std::cout << "Current arm2_arm3_joint values: " << a3 * 180.0 / M_PI << std::endl;
			// std::cout << "Current arm3_arm4_joint values: " << a4 * 180.0 / M_PI << std::endl;
		}

		// a pointer that points to a model object
	private:
		physics::ModelPtr model;

	private:
		physics::JointControllerPtr jointController;

	private:
		event::ConnectionPtr updateConnection;

		// // 	// PID object
	private:
		common::PID pid;
	};

	// Register this plugin with the simulator
	GZ_REGISTER_MODEL_PLUGIN(ModelPush)
}