; Auto-generated. Do not edit!


(cl:in-package robmovil_msgs-msg)


;//! \htmlinclude LandmarkArray.msg.html

(cl:defclass <LandmarkArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (landmarks
    :reader landmarks
    :initarg :landmarks
    :type (cl:vector robmovil_msgs-msg:Landmark)
   :initform (cl:make-array 0 :element-type 'robmovil_msgs-msg:Landmark :initial-element (cl:make-instance 'robmovil_msgs-msg:Landmark))))
)

(cl:defclass LandmarkArray (<LandmarkArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LandmarkArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LandmarkArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robmovil_msgs-msg:<LandmarkArray> is deprecated: use robmovil_msgs-msg:LandmarkArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <LandmarkArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:header-val is deprecated.  Use robmovil_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'landmarks-val :lambda-list '(m))
(cl:defmethod landmarks-val ((m <LandmarkArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robmovil_msgs-msg:landmarks-val is deprecated.  Use robmovil_msgs-msg:landmarks instead.")
  (landmarks m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LandmarkArray>) ostream)
  "Serializes a message object of type '<LandmarkArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'landmarks))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'landmarks))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LandmarkArray>) istream)
  "Deserializes a message object of type '<LandmarkArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'landmarks) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'landmarks)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'robmovil_msgs-msg:Landmark))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LandmarkArray>)))
  "Returns string type for a message object of type '<LandmarkArray>"
  "robmovil_msgs/LandmarkArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LandmarkArray)))
  "Returns string type for a message object of type 'LandmarkArray"
  "robmovil_msgs/LandmarkArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LandmarkArray>)))
  "Returns md5sum for a message object of type '<LandmarkArray>"
  "7542da8c7dee411bb2ec76a7d4d48c04")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LandmarkArray)))
  "Returns md5sum for a message object of type 'LandmarkArray"
  "7542da8c7dee411bb2ec76a7d4d48c04")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LandmarkArray>)))
  "Returns full string definition for message of type '<LandmarkArray>"
  (cl:format cl:nil "Header header~%Landmark[] landmarks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: robmovil_msgs/Landmark~%float32 range~%float32 bearing~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LandmarkArray)))
  "Returns full string definition for message of type 'LandmarkArray"
  (cl:format cl:nil "Header header~%Landmark[] landmarks~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: robmovil_msgs/Landmark~%float32 range~%float32 bearing~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LandmarkArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'landmarks) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LandmarkArray>))
  "Converts a ROS message object to a list"
  (cl:list 'LandmarkArray
    (cl:cons ':header (header msg))
    (cl:cons ':landmarks (landmarks msg))
))
