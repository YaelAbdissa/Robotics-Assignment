; Auto-generated. Do not edit!


(cl:in-package arm_lib-srv)


;//! \htmlinclude Fk-request.msg.html

(cl:defclass <Fk-request> (roslisp-msg-protocol:ros-message)
  ((link_lengths
    :reader link_lengths
    :initarg :link_lengths
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (joint_positions
    :reader joint_positions
    :initarg :joint_positions
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Fk-request (<Fk-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Fk-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Fk-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_lib-srv:<Fk-request> is deprecated: use arm_lib-srv:Fk-request instead.")))

(cl:ensure-generic-function 'link_lengths-val :lambda-list '(m))
(cl:defmethod link_lengths-val ((m <Fk-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_lib-srv:link_lengths-val is deprecated.  Use arm_lib-srv:link_lengths instead.")
  (link_lengths m))

(cl:ensure-generic-function 'joint_positions-val :lambda-list '(m))
(cl:defmethod joint_positions-val ((m <Fk-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_lib-srv:joint_positions-val is deprecated.  Use arm_lib-srv:joint_positions instead.")
  (joint_positions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Fk-request>) ostream)
  "Serializes a message object of type '<Fk-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'link_lengths))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'link_lengths))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joint_positions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'joint_positions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Fk-request>) istream)
  "Deserializes a message object of type '<Fk-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'link_lengths) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'link_lengths)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joint_positions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joint_positions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Fk-request>)))
  "Returns string type for a service object of type '<Fk-request>"
  "arm_lib/FkRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Fk-request)))
  "Returns string type for a service object of type 'Fk-request"
  "arm_lib/FkRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Fk-request>)))
  "Returns md5sum for a message object of type '<Fk-request>"
  "7853f73d8810c73a397dd4eacf4f66bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Fk-request)))
  "Returns md5sum for a message object of type 'Fk-request"
  "7853f73d8810c73a397dd4eacf4f66bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Fk-request>)))
  "Returns full string definition for message of type '<Fk-request>"
  (cl:format cl:nil "float64[] link_lengths~%float64[] joint_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Fk-request)))
  "Returns full string definition for message of type 'Fk-request"
  (cl:format cl:nil "float64[] link_lengths~%float64[] joint_positions~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Fk-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'link_lengths) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joint_positions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Fk-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Fk-request
    (cl:cons ':link_lengths (link_lengths msg))
    (cl:cons ':joint_positions (joint_positions msg))
))
;//! \htmlinclude Fk-response.msg.html

(cl:defclass <Fk-response> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass Fk-response (<Fk-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Fk-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Fk-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name arm_lib-srv:<Fk-response> is deprecated: use arm_lib-srv:Fk-response instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <Fk-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader arm_lib-srv:position-val is deprecated.  Use arm_lib-srv:position instead.")
  (position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Fk-response>) ostream)
  "Serializes a message object of type '<Fk-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Fk-response>) istream)
  "Deserializes a message object of type '<Fk-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'position) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'position)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Fk-response>)))
  "Returns string type for a service object of type '<Fk-response>"
  "arm_lib/FkResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Fk-response)))
  "Returns string type for a service object of type 'Fk-response"
  "arm_lib/FkResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Fk-response>)))
  "Returns md5sum for a message object of type '<Fk-response>"
  "7853f73d8810c73a397dd4eacf4f66bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Fk-response)))
  "Returns md5sum for a message object of type 'Fk-response"
  "7853f73d8810c73a397dd4eacf4f66bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Fk-response>)))
  "Returns full string definition for message of type '<Fk-response>"
  (cl:format cl:nil "float64[] position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Fk-response)))
  "Returns full string definition for message of type 'Fk-response"
  (cl:format cl:nil "float64[] position~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Fk-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'position) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Fk-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Fk-response
    (cl:cons ':position (position msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Fk)))
  'Fk-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Fk)))
  'Fk-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Fk)))
  "Returns string type for a service object of type '<Fk>"
  "arm_lib/Fk")