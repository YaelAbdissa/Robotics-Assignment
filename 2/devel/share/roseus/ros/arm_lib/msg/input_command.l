;; Auto-generated. Do not edit!


(when (boundp 'arm_lib::input_command)
  (if (not (find-package "ARM_LIB"))
    (make-package "ARM_LIB"))
  (shadow 'input_command (find-package "ARM_LIB")))
(unless (find-package "ARM_LIB::INPUT_COMMAND")
  (make-package "ARM_LIB::INPUT_COMMAND"))

(in-package "ROS")
;;//! \htmlinclude input_command.msg.html


(defclass arm_lib::input_command
  :super ros::object
  :slots (_command_name ))

(defmethod arm_lib::input_command
  (:init
   (&key
    ((:command_name __command_name) "")
    )
   (send-super :init)
   (setq _command_name (string __command_name))
   self)
  (:command_name
   (&optional __command_name)
   (if __command_name (setq _command_name __command_name)) _command_name)
  (:serialization-length
   ()
   (+
    ;; string _command_name
    4 (length _command_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command_name
       (write-long (length _command_name) s) (princ _command_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get arm_lib::input_command :md5sum-) "2dfd1798f31c69c161b1e153f444d458")
(setf (get arm_lib::input_command :datatype-) "arm_lib/input_command")
(setf (get arm_lib::input_command :definition-)
      "string command_name

")



(provide :arm_lib/input_command "2dfd1798f31c69c161b1e153f444d458")


