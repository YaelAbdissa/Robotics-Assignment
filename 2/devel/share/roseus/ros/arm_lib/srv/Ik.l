;; Auto-generated. Do not edit!


(when (boundp 'arm_lib::Ik)
  (if (not (find-package "ARM_LIB"))
    (make-package "ARM_LIB"))
  (shadow 'Ik (find-package "ARM_LIB")))
(unless (find-package "ARM_LIB::IK")
  (make-package "ARM_LIB::IK"))
(unless (find-package "ARM_LIB::IKREQUEST")
  (make-package "ARM_LIB::IKREQUEST"))
(unless (find-package "ARM_LIB::IKRESPONSE")
  (make-package "ARM_LIB::IKRESPONSE"))

(in-package "ROS")





(defclass arm_lib::IkRequest
  :super ros::object
  :slots (_link_lengths _joint_positions _positions ))

(defmethod arm_lib::IkRequest
  (:init
   (&key
    ((:link_lengths __link_lengths) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_positions __joint_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:positions __positions) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _link_lengths __link_lengths)
   (setq _joint_positions __joint_positions)
   (setq _positions __positions)
   self)
  (:link_lengths
   (&optional __link_lengths)
   (if __link_lengths (setq _link_lengths __link_lengths)) _link_lengths)
  (:joint_positions
   (&optional __joint_positions)
   (if __joint_positions (setq _joint_positions __joint_positions)) _joint_positions)
  (:positions
   (&optional __positions)
   (if __positions (setq _positions __positions)) _positions)
  (:serialization-length
   ()
   (+
    ;; float64[] _link_lengths
    (* 8    (length _link_lengths)) 4
    ;; float64[] _joint_positions
    (* 8    (length _joint_positions)) 4
    ;; float64[] _positions
    (* 8    (length _positions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _link_lengths
     (write-long (length _link_lengths) s)
     (dotimes (i (length _link_lengths))
       (sys::poke (elt _link_lengths i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _joint_positions
     (write-long (length _joint_positions) s)
     (dotimes (i (length _joint_positions))
       (sys::poke (elt _joint_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _positions
     (write-long (length _positions) s)
     (dotimes (i (length _positions))
       (sys::poke (elt _positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _link_lengths
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _link_lengths (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _link_lengths i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _joint_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joint_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _joint_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass arm_lib::IkResponse
  :super ros::object
  :slots (_target_positions ))

(defmethod arm_lib::IkResponse
  (:init
   (&key
    ((:target_positions __target_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _target_positions __target_positions)
   self)
  (:target_positions
   (&optional __target_positions)
   (if __target_positions (setq _target_positions __target_positions)) _target_positions)
  (:serialization-length
   ()
   (+
    ;; float64[] _target_positions
    (* 8    (length _target_positions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _target_positions
     (write-long (length _target_positions) s)
     (dotimes (i (length _target_positions))
       (sys::poke (elt _target_positions i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _target_positions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _target_positions (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _target_positions i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass arm_lib::Ik
  :super ros::object
  :slots ())

(setf (get arm_lib::Ik :md5sum-) "be8af31935508c52c6f10da29410f87d")
(setf (get arm_lib::Ik :datatype-) "arm_lib/Ik")
(setf (get arm_lib::Ik :request) arm_lib::IkRequest)
(setf (get arm_lib::Ik :response) arm_lib::IkResponse)

(defmethod arm_lib::IkRequest
  (:response () (instance arm_lib::IkResponse :init)))

(setf (get arm_lib::IkRequest :md5sum-) "be8af31935508c52c6f10da29410f87d")
(setf (get arm_lib::IkRequest :datatype-) "arm_lib/IkRequest")
(setf (get arm_lib::IkRequest :definition-)
      "float64[] link_lengths
float64[] joint_positions
float64[] positions
---
float64[] target_positions

")

(setf (get arm_lib::IkResponse :md5sum-) "be8af31935508c52c6f10da29410f87d")
(setf (get arm_lib::IkResponse :datatype-) "arm_lib/IkResponse")
(setf (get arm_lib::IkResponse :definition-)
      "float64[] link_lengths
float64[] joint_positions
float64[] positions
---
float64[] target_positions

")



(provide :arm_lib/Ik "be8af31935508c52c6f10da29410f87d")


