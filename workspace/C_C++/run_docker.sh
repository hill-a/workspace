#!/usr/bin/env bash

# Build the docker environment
docker build -t c_cpp .

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
   --name "c_cpp_hill-a" \
   -h "C_C++_hill-a" \
   c_cpp:latest

