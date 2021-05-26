# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "first_q: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ifirst_q:/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(first_q_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_custom_target(_first_q_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "first_q" "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(first_q
  "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_q
)

### Generating Services

### Generating Module File
_generate_module_cpp(first_q
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_q
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(first_q_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(first_q_generate_messages first_q_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_dependencies(first_q_generate_messages_cpp _first_q_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_q_gencpp)
add_dependencies(first_q_gencpp first_q_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_q_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(first_q
  "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_q
)

### Generating Services

### Generating Module File
_generate_module_eus(first_q
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_q
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(first_q_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(first_q_generate_messages first_q_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_dependencies(first_q_generate_messages_eus _first_q_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_q_geneus)
add_dependencies(first_q_geneus first_q_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_q_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(first_q
  "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_q
)

### Generating Services

### Generating Module File
_generate_module_lisp(first_q
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_q
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(first_q_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(first_q_generate_messages first_q_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_dependencies(first_q_generate_messages_lisp _first_q_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_q_genlisp)
add_dependencies(first_q_genlisp first_q_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_q_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(first_q
  "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_q
)

### Generating Services

### Generating Module File
_generate_module_nodejs(first_q
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_q
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(first_q_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(first_q_generate_messages first_q_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_dependencies(first_q_generate_messages_nodejs _first_q_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_q_gennodejs)
add_dependencies(first_q_gennodejs first_q_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_q_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(first_q
  "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_q
)

### Generating Services

### Generating Module File
_generate_module_py(first_q
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_q
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(first_q_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(first_q_generate_messages first_q_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/hayyuu/gg/Robotics-Assignment/assignment_ws/src/first_q/msg/my_msg.msg" NAME_WE)
add_dependencies(first_q_generate_messages_py _first_q_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(first_q_genpy)
add_dependencies(first_q_genpy first_q_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS first_q_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_q)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/first_q
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(first_q_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_q)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/first_q
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(first_q_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_q)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/first_q
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(first_q_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_q)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/first_q
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(first_q_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_q)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_q\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/first_q
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(first_q_generate_messages_py geometry_msgs_generate_messages_py)
endif()
