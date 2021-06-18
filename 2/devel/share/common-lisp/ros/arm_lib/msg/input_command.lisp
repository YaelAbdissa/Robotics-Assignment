; Auto-generated. Do not edit!


(cl:in-package arm_lib-msg)


;//! \htmlinclude input_command.msg.html

(cl:defclass <input_command> (roslisp-msg-protocol:ros-message)
  ((command_name
    :reader command_name
    :initarg :command_name
    :type cl:string
    :initform ""))
)

(cl:defclass input_command (<input_command>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <input_command>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'input_command)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_lib-msg:<input_command> is deprecated: use arm_lib-msg:input_command instead.")))

(cl:ensure-generic-function 'command_name-val :lambda-list '(m))
(cl:defmethod command_name-val ((m <input_command>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_lib-msg:command_name-val is deprecated.  Use arm_lib-msg:command_name instead.")
  (command_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <input_command>) ostream)
  "Serializes a message object of type '<input_command>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <input_command>) istream)
  "Deserializes a message object of type '<input_command>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<input_command>)))
  "Returns string type for a message object of type '<input_command>"
  "arm_lib/input_command")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'input_command)))
  "Returns string type for a message object of type 'input_command"
  "arm_lib/input_command")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<input_command>)))
  "Returns md5sum for a message object of type '<input_command>"
  "2dfd1798f31c69c161b1e153f444d458")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'input_command)))
  "Returns md5sum for a message object of type 'input_command"
  "2dfd1798f31c69c161b1e153f444d458")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<input_command>)))
  "Returns full string definition for message of type '<input_command>"
  (cl:format cl:nil "string command_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'input_command)))
  "Returns full string definition for message of type 'input_command"
  (cl:format cl:nil "string command_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <input_command>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <input_command>))
  "Converts a ROS message object to a list"
  (cl:list 'input_command
    (cl:cons ':command_name (command_name msg))
))
