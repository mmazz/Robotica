;; Auto-generated. Do not edit!


(when (boundp 'robmovil_msgs::EncoderTicks)
  (if (not (find-package "ROBMOVIL_MSGS"))
    (make-package "ROBMOVIL_MSGS"))
  (shadow 'EncoderTicks (find-package "ROBMOVIL_MSGS")))
(unless (find-package "ROBMOVIL_MSGS::ENCODERTICKS")
  (make-package "ROBMOVIL_MSGS::ENCODERTICKS"))

(in-package "ROS")
;;//! \htmlinclude EncoderTicks.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass robmovil_msgs::EncoderTicks
  :super ros::object
  :slots (_header _ticks_left _ticks_right ))

(defmethod robmovil_msgs::EncoderTicks
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ticks_left __ticks_left) (instance std_msgs::Int32 :init))
    ((:ticks_right __ticks_right) (instance std_msgs::Int32 :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ticks_left __ticks_left)
   (setq _ticks_right __ticks_right)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ticks_left
   (&rest __ticks_left)
   (if (keywordp (car __ticks_left))
       (send* _ticks_left __ticks_left)
     (progn
       (if __ticks_left (setq _ticks_left (car __ticks_left)))
       _ticks_left)))
  (:ticks_right
   (&rest __ticks_right)
   (if (keywordp (car __ticks_right))
       (send* _ticks_right __ticks_right)
     (progn
       (if __ticks_right (setq _ticks_right (car __ticks_right)))
       _ticks_right)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; std_msgs/Int32 _ticks_left
    (send _ticks_left :serialization-length)
    ;; std_msgs/Int32 _ticks_right
    (send _ticks_right :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; std_msgs/Int32 _ticks_left
       (send _ticks_left :serialize s)
     ;; std_msgs/Int32 _ticks_right
       (send _ticks_right :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; std_msgs/Int32 _ticks_left
     (send _ticks_left :deserialize buf ptr-) (incf ptr- (send _ticks_left :serialization-length))
   ;; std_msgs/Int32 _ticks_right
     (send _ticks_right :deserialize buf ptr-) (incf ptr- (send _ticks_right :serialization-length))
   ;;
   self)
  )

(setf (get robmovil_msgs::EncoderTicks :md5sum-) "812913f836fe389b0d890bde3b74459e")
(setf (get robmovil_msgs::EncoderTicks :datatype-) "robmovil_msgs/EncoderTicks")
(setf (get robmovil_msgs::EncoderTicks :definition-)
      "std_msgs/Header header
std_msgs/Int32 ticks_left
std_msgs/Int32 ticks_right

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



(provide :robmovil_msgs/EncoderTicks "812913f836fe389b0d890bde3b74459e")


