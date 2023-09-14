#!/bin/sh
HOST_DIR=$1
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
sudo touch $XAUTH
sudo xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
xhost +
# Comment out if you don't have a nvidia GPU
# More info: http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration
#GPU_OPTIONS="--gpus all --runtime=nvidia"
#TMUX_CONF=$HOME/.tmux.conf      # Comment out if you don't have tmux
           #--volume /home/hydrone/hydrone_ros1_ws:/home/turtlebot3/catkin_ws:rw \

docker run --privileged -it \
           --volume /home/hydrone/catkin_ws:/home/hydrone/catkin_ws:rw \
           --volume=$XSOCK:$XSOCK:rw \
           --volume=$XAUTH:$XAUTH:rw \
           --volume=/dev:/dev:rw \
           --volume=/var/run/dbus/system_bus_socket:/var/run/dbus/system_bus_socket \
           --gpus all  \
           --shm-size=1gb \
           --env="XAUTHORITY=${XAUTH}" \
           --env="DISPLAY=${DISPLAY}" \
           --env=QT_X11_NO_MITSHM=1 \
           --net=host \
           alikolling/ros:hydrone \
           bash
