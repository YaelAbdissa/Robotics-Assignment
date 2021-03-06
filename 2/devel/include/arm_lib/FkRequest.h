// Generated by gencpp from file arm_lib/FkRequest.msg
// DO NOT EDIT!


#ifndef ARM_LIB_MESSAGE_FKREQUEST_H
#define ARM_LIB_MESSAGE_FKREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace arm_lib
{
template <class ContainerAllocator>
struct FkRequest_
{
  typedef FkRequest_<ContainerAllocator> Type;

  FkRequest_()
    : link_lengths()
    , joint_positions()  {
    }
  FkRequest_(const ContainerAllocator& _alloc)
    : link_lengths(_alloc)
    , joint_positions(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _link_lengths_type;
  _link_lengths_type link_lengths;

   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _joint_positions_type;
  _joint_positions_type joint_positions;





  typedef boost::shared_ptr< ::arm_lib::FkRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::arm_lib::FkRequest_<ContainerAllocator> const> ConstPtr;

}; // struct FkRequest_

typedef ::arm_lib::FkRequest_<std::allocator<void> > FkRequest;

typedef boost::shared_ptr< ::arm_lib::FkRequest > FkRequestPtr;
typedef boost::shared_ptr< ::arm_lib::FkRequest const> FkRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::arm_lib::FkRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::arm_lib::FkRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::arm_lib::FkRequest_<ContainerAllocator1> & lhs, const ::arm_lib::FkRequest_<ContainerAllocator2> & rhs)
{
  return lhs.link_lengths == rhs.link_lengths &&
    lhs.joint_positions == rhs.joint_positions;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::arm_lib::FkRequest_<ContainerAllocator1> & lhs, const ::arm_lib::FkRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace arm_lib

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::arm_lib::FkRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::arm_lib::FkRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::arm_lib::FkRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::arm_lib::FkRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::arm_lib::FkRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::arm_lib::FkRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::arm_lib::FkRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ed7bb81087729fedb2eb38532f77b1f2";
  }

  static const char* value(const ::arm_lib::FkRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xed7bb81087729fedULL;
  static const uint64_t static_value2 = 0xb2eb38532f77b1f2ULL;
};

template<class ContainerAllocator>
struct DataType< ::arm_lib::FkRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "arm_lib/FkRequest";
  }

  static const char* value(const ::arm_lib::FkRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::arm_lib::FkRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] link_lengths\n"
"float64[] joint_positions\n"
;
  }

  static const char* value(const ::arm_lib::FkRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::arm_lib::FkRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.link_lengths);
      stream.next(m.joint_positions);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FkRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::arm_lib::FkRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::arm_lib::FkRequest_<ContainerAllocator>& v)
  {
    s << indent << "link_lengths[]" << std::endl;
    for (size_t i = 0; i < v.link_lengths.size(); ++i)
    {
      s << indent << "  link_lengths[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.link_lengths[i]);
    }
    s << indent << "joint_positions[]" << std::endl;
    for (size_t i = 0; i < v.joint_positions.size(); ++i)
    {
      s << indent << "  joint_positions[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.joint_positions[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // ARM_LIB_MESSAGE_FKREQUEST_H
