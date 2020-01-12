; Auto-generated. Do not edit!


(cl:in-package robmovil_msgs-msg)


;//! \htmlinclude MultiEncoderTicks.msg.html

(cl:defclass <MultiEncoderTicks> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (ticks
    :reader ticks
    :initarg :ticks
    :type (cl:vector std_msgs-msg:Int32)
   :initform (cl:make-array 0 :element-type 'std_msgs-msg:Int32 :initial-element (cl:make-instance 'std_msgs-msg:Int32))))
)

(cl:defclass MultiEncoderTicks (<MultiEncoderTicks>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MultiEncoderTicks>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MultiEncoderTicks)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robmovil_msgs-msg:<MultiEncoderTicks> is deprecated: use robmovil_msgs-msg:MultiEncoderTicks instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <MultiEncoderTicks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:header-val is deprecated.  Use robmovil_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'ticks-val :lambda-list '(m))
(cl:defmethod ticks-val ((m <MultiEncoderTicks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:ticks-val is deprecated.  Use robmovil_msgs-msg:ticks instead.")
  (ticks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MultiEncoderTicks>) ostream)
  "Serializes a message object of type '<MultiEncoderTicks>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ticks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ticks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MultiEncoderTicks>) istream)
  "Deserializes a message object of type '<MultiEncoderTicks>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ticks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ticks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'std_msgs-msg:Int32))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MultiEncoderTicks>)))
  "Returns string type for a message object of type '<MultiEncoderTicks>"
  "robmovil_msgs/MultiEncoderTicks")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MultiEncoderTicks)))
  "Returns string type for a message object of type 'MultiEncoderTicks"
  "robmovil_msgs/MultiEncoderTicks")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MultiEncoderTicks>)))
  "Returns md5sum for a message object of type '<MultiEncoderTicks>"
  "67269bfa0c66142719822956730142e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MultiEncoderTicks)))
  "Returns md5sum for a message object of type 'MultiEncoderTicks"
  "67269bfa0c66142719822956730142e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MultiEncoderTicks>)))
  "Returns full string definition for message of type '<MultiEncoderTicks>"
  (cl:format cl:nil "std_msgs/Header header~%~%# Each array element correspond to one joint encoder information.~%std_msgs/Int32[] ticks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MultiEncoderTicks)))
  "Returns full string definition for message of type 'MultiEncoderTicks"
  (cl:format cl:nil "std_msgs/Header header~%~%# Each array element correspond to one joint encoder information.~%std_msgs/Int32[] ticks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Int32~%int32 data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MultiEncoderTicks>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ticks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MultiEncoderTicks>))
  "Converts a ROS message object to a list"
  (cl:list 'MultiEncoderTicks
    (cl:cons ':header (header msg))
    (cl:cons ':ticks (ticks msg))
))
