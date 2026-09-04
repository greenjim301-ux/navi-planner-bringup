#!/usr/bin/env bash
# Brings up hand-lio + SCAN-Planner + unitree_bridge together (launch/bringup.launch).
# Meant to be run by systemd/navi-planner.service, not sourced or run interactively.
set -e

WS=/home/cat/ros1_ws

# ros_noetic_env is a RoboStack (conda-forge) ROS Noetic install, not /opt/ros --
# it needs `conda activate`, not just sourcing devel/setup.bash, to get its full
# runtime env (LD_LIBRARY_PATH, GDAL/PROJ data dirs, etc. set by its activate.d hooks).
source /home/cat/HandBot_bash/rosmaster.bash
# conda activate ros_noetic_env

source "$WS/devel/setup.bash"

# navi_mode: 1 rviz 2D Nav Goal, 2 waypoints, 3 reference path.
# Override any of these from the systemd unit with Environment=NAVI_MODE=3 etc.,
# rather than editing this script.
exec roslaunch "$WS/launch/bringup.launch" \
  navi_mode:="${NAVI_MODE:-1}" \
  sensor_type:="${SENSOR_TYPE:-lidar}" \
  controller_mode:="${CONTROLLER_MODE:-closed_loop}"
