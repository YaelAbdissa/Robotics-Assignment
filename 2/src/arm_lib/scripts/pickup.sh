#!/bin/bash
sleep 3
rostopic pub --once /positions arm_lib/positions -- {2.3,0.28,0.25} 
rostopic pub --once /command_chatter arm_lib/input_command catch
rostopic pub --once /positions arm_lib/positions -- {2,-1.3,1.5}
rostopic pub --once /positions arm_lib/positions -- {2,-1.3,0.5}
rostopic pub --once /command_chatter arm_lib/input_command release
rostopic pub --once /positions arm_lib/positions -- {0,1.411,3.385}
