;; Auto-generated. Do not edit!


(when (boundp 'robmovil_msgs::Landmark)
  (if (not (find-package "ROBMOVIL_MSGS"))
    (make-package "ROBMOVIL_MSGS"))
  (shadow 'Landmark (find-package "ROBMOVIL_MSGS")))
(unless (find-package "ROBMOVIL_MSGS::LANDMARK")
  (make-package "ROBMOVIL_MSGS::LANDMARK"))

(in-package "ROS")
;;//! \htmlinclude Landmark.msg.html


(defclass robmovil_msgs::Landmark
  :super ros::object
  :slots (_range _bearing ))

(defmethod robmovil_msgs::Landmark
  (:init
   (&key
    ((:range __range) 0.0)
    ((:bearing __bearing) 0.0)
    )
   (send-super :init)
   (setq _range (float __range))
   (setq _bearing (float __bearing))
   self)
  (:range
   (&optional __range)
   (if __range (setq _range __range)) _range)
  (:bearing
   (&optional __bearing)
   (if __bearing (setq _bearing __bearing)) _bearing)
  (:serialization-length
   ()
   (+
    ;; float32 _range
    4
    ;; float32 _bearing
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _range
       (sys::poke _range (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bearing
       (sys::poke _bearing (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _range
     (setq _range (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bearing
     (setq _bearing (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robmovil_msgs::Landmark :md5sum-) "90f01577d6cf664c77376bc73ab5c487")
(setf (get robmovil_msgs::Landmark :datatype-) "robmovil_msgs/Landmark")
(setf (get robmovil_msgs::Landmark :definition-)
      "float32 range
float32 bearing

")



(provide :robmovil_msgs/Landmark "90f01577d6cf664c77376bc73ab5c487")


