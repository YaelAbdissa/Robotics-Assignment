
(cl:in-package :asdf)

(defsystem "arm_lib-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Fk" :depends-on ("_package_Fk"))
    (:file "_package_Fk" :depends-on ("_package"))
    (:file "Ik" :depends-on ("_package_Ik"))
    (:file "_package_Ik" :depends-on ("_package"))
  ))