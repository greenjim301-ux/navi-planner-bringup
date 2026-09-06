#!/usr/bin/env bash
# Brings up hand-lio (launch/hand_lio.launch in the hand-lio package).
# Meant to be run by systemd/hand_lio.service, not sourced or run interactively.
set -e

WS=/home/cat/ros1_ws

# ros_noetic_env is a RoboStack (conda-forge) ROS Noetic install, not /opt/ros --
# it needs `conda activate`, not just sourcing devel/setup.bash, to get its full
# runtime env (LD_LIBRARY_PATH, GDAL/PROJ data dirs, etc. set by its activate.d hooks).
source /home/cat/HandBot_bash/rosmaster.bash
# conda activate ros_noetic_env

source "$WS/devel/setup.bash"

exec roslaunch hand_lio hand_lio.launch
