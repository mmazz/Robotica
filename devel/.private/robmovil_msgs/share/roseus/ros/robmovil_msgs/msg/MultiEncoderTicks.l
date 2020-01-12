;; Auto-generated. Do not edit!


(when (boundp 'robmovil_msgs::MultiEncoderTicks)
  (if (not (find-package "ROBMOVIL_MSGS"))
    (make-package "ROBMOVIL_MSGS"))
  (shadow 'MultiEncoderTicks (find-package "ROBMOVIL_MSGS")))
(unless (find-package "ROBMOVIL_MSGS::MULTIENCODERTICKS")
  (make-package "ROBMOVIL_MSGS::MULTIENCODERTICKS"))

(in-package "ROS")
;;//! \htmlinclude MultiEncoderTicks.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robmovil_msgs::MultiEncoderTicks
  :super ros::object
  :slots (_header _ticks ))

(defmethod robmovil_msgs::MultiEncoderTicks
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ticks __ticks) (let (r) (dotimes (i 0) (push (instance std_msgs::Int32 :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ticks __ticks)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ticks
   (&rest __ticks)
   (if (keywordp (car __ticks))
       (send* _ticks __ticks)
     (progn
       (if __ticks (setq _ticks (car __ticks)))
       _ticks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Int32[] _ticks
    (apply #'+ (send-all _ticks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Int32[] _ticks
     (write-long (length _ticks) s)
     (dolist (elem _ticks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Int32[] _ticks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ticks (let (r) (dotimes (i n) (push (instance std_msgs::Int32 :init) r)) r))
     (dolist (elem- _ticks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get robmovil_msgs::MultiEncoderTicks :md5sum-) "67269bfa0c66142719822956730142e3")
(setf (get robmovil_msgs::MultiEncoderTicks :datatype-) "robmovil_msgs/MultiEncoderTicks")
(setf (get robmovil_msgs::MultiEncoderTicks :definition-)
      "std_msgs/Header header

# Each array element correspond to one joint encoder information.
std_msgs/Int32[] ticks

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

================================================================================
MSG: std_msgs/Int32
int32 data
")



(provide :robmovil_msgs/MultiEncoderTicks "67269bfa0c66142719822956730142e3")


