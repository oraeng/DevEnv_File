#!/bin/bash
source ~/.bashrc
git clone https://github.com/PX4/px4_ros_com.git ~/robot_ws/src/px4_ros_com
git clone https://github.com/PX4/px4_msgs.git ~/robot_ws/src/px4_msgs
cd ~/catkin_ws/src
git clone https://github.com/PX4/px4_ros_com.git ~/catkin_ws/src/px4_ros_com -b ros1
git clone https://github.com/PX4/px4_msgs.git ~/catkin_ws/src/px4_msgs -b ros1
source /opt/ros/dashing/setup.bash
git clone https://github.com/ros2/ros1_bridge.git -b dashing ~/robot_ws/src/ros1_bridge
cd /root/robot_ws/
colcon build --symlink-install --packages-skip ros1_bridge --event-handlers console_direct+
source /opt/ros/melodic/setup.bash
cd /root/catkin_ws
colcon build --symlink-install --event-handlers console_direct+
source ~/catkin_ws/install/setup.bash
/bin/bash -c source ~/robot_ws/install/setup.bash
cd /root/robot_ws
colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure --event-handlers console_direct+
