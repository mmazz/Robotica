;; Auto-generated. Do not edit!


(when (boundp 'universal_teleop::Control)
  (if (not (find-package "UNIVERSAL_TELEOP"))
    (make-package "UNIVERSAL_TELEOP"))
  (shadow 'Control (find-package "UNIVERSAL_TELEOP")))
(unless (find-package "UNIVERSAL_TELEOP::CONTROL")
  (make-package "UNIVERSAL_TELEOP::CONTROL"))

(in-package "ROS")
;;//! \htmlinclude Control.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass universal_teleop::Control
  :super ros::object
  :slots (_header _controls _values ))

(defmethod universal_teleop::Control
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:controls __controls) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:values __values) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _header __header)
   (setq _controls __controls)
   (setq _values __values)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:controls
   (&optional __controls)
   (if __controls (setq _controls __controls)) _controls)
  (:values
   (&optional __values)
   (if __values (setq _values __values)) _values)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; string[] _controls
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _controls)) 4
    ;; float32[] _values
    (* 4    (length _values)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; string[] _controls
     (write-long (length _controls) s)
     (dolist (elem _controls)
       (write-long (length elem) s) (princ elem s)
       )
     ;; float32[] _values
     (write-long (length _values) s)
     (dotimes (i (length _values))
       (sys::poke (elt _values i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; string[] _controls
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _controls (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _controls i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; float32[] _values
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _values (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _values i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get universal_teleop::Control :md5sum-) "dab96ca8530e6a319a58ba491577719b")
(setf (get universal_teleop::Control :datatype-) "universal_teleop/Control")
(setf (get universal_teleop::Control :definition-)
      "Header header
string[] controls
float32[] values

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :universal_teleop/Control "dab96ca8530e6a319a58ba491577719b")


