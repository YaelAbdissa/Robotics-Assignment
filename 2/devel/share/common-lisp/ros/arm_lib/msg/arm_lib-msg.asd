
(cl:in-package :asdf)

(defsystem "arm_lib-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "input_command" :depends-on ("_package_input_command"))
    (:file "_package_input_command" :depends-on ("_package"))
    (:file "jointAngles" :depends-on ("_package_jointAngles"))
    (:file "_package_jointAngles" :depends-on ("_package"))
    (:file "positions" :depends-on ("_package_positions"))
    (:file "_package_positions" :depends-on ("_package"))
  ))