// Auto-generated. Do not edit!

// (in-package arm_lib.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class input_command {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command_name = null;
    }
    else {
      if (initObj.hasOwnProperty('command_name')) {
        this.command_name = initObj.command_name
      }
      else {
        this.command_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type input_command
    // Serialize message field [command_name]
    bufferOffset = _serializer.string(obj.command_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type input_command
    let len;
    let data = new input_command(null);
    // Deserialize message field [command_name]
    data.command_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.command_name);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'arm_lib/input_command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2dfd1798f31c69c161b1e153f444d458';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string command_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new input_command(null);
    if (msg.command_name !== undefined) {
      resolved.command_name = msg.command_name;
    }
    else {
      resolved.command_name = ''
    }

    return resolved;
    }
};

module.exports = input_command;
