; Auto-generated. Do not edit!


(cl:in-package robmovil_msgs-msg)


;//! \htmlinclude EncoderTicks.msg.html

(cl:defclass <EncoderTicks> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ticks_left
    :reader ticks_left
    :initarg :ticks_left
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32))
   (ticks_right
    :reader ticks_right
    :initarg :ticks_right
    :type std_msgs-msg:Int32
    :initform (cl:make-instance 'std_msgs-msg:Int32)))
)

(cl:defclass EncoderTicks (<EncoderTicks>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EncoderTicks>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EncoderTicks)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robmovil_msgs-msg:<EncoderTicks> is deprecated: use robmovil_msgs-msg:EncoderTicks instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <EncoderTicks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:header-val is deprecated.  Use robmovil_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ticks_left-val :lambda-list '(m))
(cl:defmethod ticks_left-val ((m <EncoderTicks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:ticks_left-val is deprecated.  Use robmovil_msgs-msg:ticks_left instead.")
  (ticks_left m))

(cl:ensure-generic-function 'ticks_right-val :lambda-list '(m))
(cl:defmethod ticks_right-val ((m <EncoderTicks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:ticks_right-val is deprecated.  Use robmovil_msgs-msg:ticks_right instead.")
  (ticks_right m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EncoderTicks>) ostream)
  "Serializes a message object of type '<EncoderTicks>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ticks_left) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ticks_right) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EncoderTicks>) istream)
  "Deserializes a message object of type '<EncoderTicks>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ticks_left) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ticks_right) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EncoderTicks>)))
  "Returns string type for a message object of type '<EncoderTicks>"
  "robmovil_msgs/EncoderTicks")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EncoderTicks)))
  "Returns string type for a message object of type 'EncoderTicks"
  "robmovil_msgs/EncoderTicks")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EncoderTicks>)))
  "Returns md5sum for a message object of type '<EncoderTicks>"
  "812913f836fe389b0d890bde3b74459e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EncoderTicks)))
  "Returns md5sum for a message object of type 'EncoderTicks"
  "812913f836fe389b0d890bde3b74459e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EncoderTicks>)))
  "Returns full string definition for message of type '<EncoderTicks>"
  (cl:format cl:nil "std_msgs/Header header~%std_msgs/Int32 ticks_left~%std_msgs/Int32 ticks_right~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EncoderTicks)))
  "Returns full string definition for message of type 'EncoderTicks"
  (cl:format cl:nil "std_msgs/Header header~%std_msgs/Int32 ticks_left~%std_msgs/Int32 ticks_right~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EncoderTicks>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ticks_left))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ticks_right))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EncoderTicks>))
  "Converts a ROS message object to a list"
  (cl:list 'EncoderTicks
    (cl:cons ':header (header msg))
    (cl:cons ':ticks_left (ticks_left msg))
    (cl:cons ':ticks_right (ticks_right msg))
))
