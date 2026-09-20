#!/usr/bin/env bash
# Brings up deep_bridge (launch/deep_bridge.launch in the deep_bridge package):
# cmd_vel -> Deep Robotics Lynx M20 UDP/JSON body-monitoring protocol.
# Meant to be run by systemd/deep_bridge.service, not sourced or run interactively.
set -e

WS=/home/cat/ros1_ws

# ros_noetic_env is a RoboStack (conda-forge) ROS Noetic install, not /opt/ros --
# it needs `conda activate`, not just sourcing devel/setup.bash, to get its full
# runtime env (LD_LIBRARY_PATH, GDAL/PROJ data dirs, etc. set by its activate.d hooks).
source /home/cat/HandBot_bash/rosmaster.bash
# conda activate ros_noetic_env

source "$WS/devel/setup.bash"

exec roslaunch deep_bridge deep_bridge.launch
