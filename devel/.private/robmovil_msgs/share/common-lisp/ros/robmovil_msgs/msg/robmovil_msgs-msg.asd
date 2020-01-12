
(cl:in-package :asdf)

(defsystem "robmovil_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "EncoderTicks" :depends-on ("_package_EncoderTicks"))
    (:file "_package_EncoderTicks" :depends-on ("_package"))
    (:file "Landmark" :depends-on ("_package_Landmark"))
    (:file "_package_Landmark" :depends-on ("_package"))
    (:file "LandmarkArray" :depends-on ("_package_LandmarkArray"))
    (:file "_package_LandmarkArray" :depends-on ("_package"))
    (:file "MultiEncoderTicks" :depends-on ("_package_MultiEncoderTicks"))
    (:file "_package_MultiEncoderTicks" :depends-on ("_package"))
    (:file "Trajectory" :depends-on ("_package_Trajectory"))
    (:file "_package_Trajectory" :depends-on ("_package"))
    (:file "TrajectoryPoint" :depends-on ("_package_TrajectoryPoint"))
    (:file "_package_TrajectoryPoint" :depends-on ("_package"))
  ))