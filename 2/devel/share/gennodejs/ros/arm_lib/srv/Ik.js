// Auto-generated. Do not edit!

// (in-package arm_lib.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class IkRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.link_lengths = null;
      this.joint_positions = null;
      this.positions = null;
    }
    else {
      if (initObj.hasOwnProperty('link_lengths')) {
        this.link_lengths = initObj.link_lengths
      }
      else {
        this.link_lengths = [];
      }
      if (initObj.hasOwnProperty('joint_positions')) {
        this.joint_positions = initObj.joint_positions
      }
      else {
        this.joint_positions = [];
      }
      if (initObj.hasOwnProperty('positions')) {
        this.positions = initObj.positions
      }
      else {
        this.positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IkRequest
    // Serialize message field [link_lengths]
    bufferOffset = _arraySerializer.float64(obj.link_lengths, buffer, bufferOffset, null);
    // Serialize message field [joint_positions]
    bufferOffset = _arraySerializer.float64(obj.joint_positions, buffer, bufferOffset, null);
    // Serialize message field [positions]
    bufferOffset = _arraySerializer.float64(obj.positions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IkRequest
    let len;
    let data = new IkRequest(null);
    // Deserialize message field [link_lengths]
    data.link_lengths = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_positions]
    data.joint_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [positions]
    data.positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.link_lengths.length;
    length += 8 * object.joint_positions.length;
    length += 8 * object.positions.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'arm_lib/IkRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '070563dd2198a94495c4bd7fe8a5484c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] link_lengths
    float64[] joint_positions
    float64[] positions
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IkRequest(null);
    if (msg.link_lengths !== undefined) {
      resolved.link_lengths = msg.link_lengths;
    }
    else {
      resolved.link_lengths = []
    }

    if (msg.joint_positions !== undefined) {
      resolved.joint_positions = msg.joint_positions;
    }
    else {
      resolved.joint_positions = []
    }

    if (msg.positions !== undefined) {
      resolved.positions = msg.positions;
    }
    else {
      resolved.positions = []
    }

    return resolved;
    }
};

class IkResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_positions = null;
    }
    else {
      if (initObj.hasOwnProperty('target_positions')) {
        this.target_positions = initObj.target_positions
      }
      else {
        this.target_positions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type IkResponse
    // Serialize message field [target_positions]
    bufferOffset = _arraySerializer.float64(obj.target_positions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type IkResponse
    let len;
    let data = new IkResponse(null);
    // Deserialize message field [target_positions]
    data.target_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.target_positions.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'arm_lib/IkResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0fd84c0985418c9e7020e2efc8f95f49';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] target_positions
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new IkResponse(null);
    if (msg.target_positions !== undefined) {
      resolved.target_positions = msg.target_positions;
    }
    else {
      resolved.target_positions = []
    }

    return resolved;
    }
};

module.exports = {
  Request: IkRequest,
  Response: IkResponse,
  md5sum() { return 'be8af31935508c52c6f10da29410f87d'; },
  datatype() { return 'arm_lib/Ik'; }
};
