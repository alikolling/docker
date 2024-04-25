#!/bin/sh

# Comment out if you don't have a nvidia GPU
# More info: http://wiki.ros.org/docker/Tutorials/Hardware%20Acceleration
#GPU_OPTIONS="--gpus all --runtime=nvidia"
#TMUX_CONF=$HOME/.tmux.conf      # Comment out if you don't have tmux

docker run --privileged -it \
           --env=DISPLAY=$DISPLAY \
           --env=XAUTHORITY=/root/.Xauthority \
           --volume ~/.Xauthority:~/.Xauthority \
           --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
           --mount src="$(pwd)",target=/home/mamba/stable-baselines3,type=bind \
           --runtime=nvidia \
           --gpus all  \
           --shm-size=1gb \
           --net=host \
           -u root \
           stablebaselines/stable-baselines3 \
           bash
