
(cl:in-package :asdf)

(defsystem "arm_lib-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "jointAngles" :depends-on ("_package_jointAngles"))
    (:file "_package_jointAngles" :depends-on ("_package"))
  ))