// Auto-generated. Do not edit!

// (in-package robmovil_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class EncoderTicks {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.ticks_left = null;
      this.ticks_right = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('ticks_left')) {
        this.ticks_left = initObj.ticks_left
      }
      else {
        this.ticks_left = new std_msgs.msg.Int32();
      }
      if (initObj.hasOwnProperty('ticks_right')) {
        this.ticks_right = initObj.ticks_right
      }
      else {
        this.ticks_right = new std_msgs.msg.Int32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EncoderTicks
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [ticks_left]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.ticks_left, buffer, bufferOffset);
    // Serialize message field [ticks_right]
    bufferOffset = std_msgs.msg.Int32.serialize(obj.ticks_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EncoderTicks
    let len;
    let data = new EncoderTicks(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [ticks_left]
    data.ticks_left = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    // Deserialize message field [ticks_right]
    data.ticks_right = std_msgs.msg.Int32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robmovil_msgs/EncoderTicks';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '812913f836fe389b0d890bde3b74459e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EncoderTicks(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.ticks_left !== undefined) {
      resolved.ticks_left = std_msgs.msg.Int32.Resolve(msg.ticks_left)
    }
    else {
      resolved.ticks_left = new std_msgs.msg.Int32()
    }

    if (msg.ticks_right !== undefined) {
      resolved.ticks_right = std_msgs.msg.Int32.Resolve(msg.ticks_right)
    }
    else {
      resolved.ticks_right = new std_msgs.msg.Int32()
    }

    return resolved;
    }
};

module.exports = EncoderTicks;
