;; Auto-generated. Do not edit!


(when (boundp 'arm_lib::Fk)
  (if (not (find-package "ARM_LIB"))
    (make-package "ARM_LIB"))
  (shadow 'Fk (find-package "ARM_LIB")))
(unless (find-package "ARM_LIB::FK")
  (make-package "ARM_LIB::FK"))
(unless (find-package "ARM_LIB::FKREQUEST")
  (make-package "ARM_LIB::FKREQUEST"))
(unless (find-package "ARM_LIB::FKRESPONSE")
  (make-package "ARM_LIB::FKRESPONSE"))

(in-package "ROS")





(defclass arm_lib::FkRequest
  :super ros::object
  :slots (_link_lengths _joint_positions ))

(defmethod arm_lib::FkRequest
  (:init
   (&key
    ((:link_lengths __link_lengths) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:joint_positions __joint_positions) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _link_lengths __link_lengths)
   (setq _joint_positions __joint_positions)
   self)
  (:link_lengths
   (&optional __link_lengths)
   (if __link_lengths (setq _link_lengths __link_lengths)) _link_lengths)
  (:joint_positions
   (&optional __joint_positions)
   (if __joint_positions (setq _joint_positions __joint_positions)) _joint_positions)
  (:serialization-length
   ()
   (+
    ;; float64[] _link_lengths
    (* 8    (length _link_lengths)) 4
    ;; float64[] _joint_positions
    (* 8    (length _joint_positions)) 4
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
   ;;
   self)
  )

(defclass arm_lib::FkResponse
  :super ros::object
  :slots (_position ))

(defmethod arm_lib::FkResponse
  (:init
   (&key
    ((:position __position) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _position __position)
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:serialization-length
   ()
   (+
    ;; float64[] _position
    (* 8    (length _position)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _position
     (write-long (length _position) s)
     (dotimes (i (length _position))
       (sys::poke (elt _position i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _position
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _position (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _position i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(defclass arm_lib::Fk
  :super ros::object
  :slots ())

(setf (get arm_lib::Fk :md5sum-) "7853f73d8810c73a397dd4eacf4f66bb")
(setf (get arm_lib::Fk :datatype-) "arm_lib/Fk")
(setf (get arm_lib::Fk :request) arm_lib::FkRequest)
(setf (get arm_lib::Fk :response) arm_lib::FkResponse)

(defmethod arm_lib::FkRequest
  (:response () (instance arm_lib::FkResponse :init)))

(setf (get arm_lib::FkRequest :md5sum-) "7853f73d8810c73a397dd4eacf4f66bb")
(setf (get arm_lib::FkRequest :datatype-) "arm_lib/FkRequest")
(setf (get arm_lib::FkRequest :definition-)
      "float64[] link_lengths
float64[] joint_positions
---
float64[] position

")

(setf (get arm_lib::FkResponse :md5sum-) "7853f73d8810c73a397dd4eacf4f66bb")
(setf (get arm_lib::FkResponse :datatype-) "arm_lib/FkResponse")
(setf (get arm_lib::FkResponse :definition-)
      "float64[] link_lengths
float64[] joint_positions
---
float64[] position

")



(provide :arm_lib/Fk "7853f73d8810c73a397dd4eacf4f66bb")


