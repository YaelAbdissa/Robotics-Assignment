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

class FkRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.link_lengths = null;
      this.joint_positions = null;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FkRequest
    // Serialize message field [link_lengths]
    bufferOffset = _arraySerializer.float64(obj.link_lengths, buffer, bufferOffset, null);
    // Serialize message field [joint_positions]
    bufferOffset = _arraySerializer.float64(obj.joint_positions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FkRequest
    let len;
    let data = new FkRequest(null);
    // Deserialize message field [link_lengths]
    data.link_lengths = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [joint_positions]
    data.joint_positions = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.link_lengths.length;
    length += 8 * object.joint_positions.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'arm_lib/FkRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed7bb81087729fedb2eb38532f77b1f2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] link_lengths
    float64[] joint_positions
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FkRequest(null);
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

    return resolved;
    }
};

class FkResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FkResponse
    // Serialize message field [position]
    bufferOffset = _arraySerializer.float64(obj.position, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FkResponse
    let len;
    let data = new FkResponse(null);
    // Deserialize message field [position]
    data.position = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.position.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'arm_lib/FkResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '50410efb3480c63b23b8b5fe2bea331a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] position
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FkResponse(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = []
    }

    return resolved;
    }
};

module.exports = {
  Request: FkRequest,
  Response: FkResponse,
  md5sum() { return '7853f73d8810c73a397dd4eacf4f66bb'; },
  datatype() { return 'arm_lib/Fk'; }
};
