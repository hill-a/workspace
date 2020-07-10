#!/usr/bin/env bash

# Get stable_baselines
if [ ! -d "./stable-baselines" ]; then
    git clone -b v2.10.0 https://github.com/hill-a/stable-baselines.git
fi

# Build the docker environment
docker build -t stable_baselines .

# Start a bash shell for the user
docker run --rm -it \
   --user=$(id -u) \
   --env="DISPLAY" \
   --env="DOCKER=1" \
   --volume="/etc/group:/etc/group:ro" \
   --volume="/etc/passwd:/etc/passwd:ro" \
   --volume="/etc/shadow:/etc/shadow:ro" \
   --volume="/etc/sudoers.d:/etc/sudoers.d:ro" \
   --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
   --volume="$(pwd):/home/" \
   --workdir=/home \
   --network host \
   --ipc=host \
   --name "stable_baselines_hill-a" \
   -h "stable_baselines_hill-a" \
   stable_baselines:latest

