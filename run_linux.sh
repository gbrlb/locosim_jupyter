#!/bin/bash

# Automatically detect NVIDIA's GPU and try to use it
if [ -z "$(lspci | grep NVIDIA)" ]; then
		USE_GPUS=""
		echo "NVIDIA's GPU WAS NOT detected."
else
		USE_GPUS="--gpus all"
		echo "NVIDIA's GPU WAS detected. Activating '--gpus all' flag."
fi

docker run --rm -it  \
	$USE_GPUS \
	--user=$(id -u):$(id -g) \
	--env USER  \
	--env HOME \
	--env SHELL \
	--env DOCKER=1  \
	--env DISPLAY \
	--env QT_X11_NO_MITSHM=1 \
	-p 8888:8888 \
	--volume "/etc/group:/etc/group:ro" \
	--volume "/etc/passwd:/etc/passwd:ro" \
	--volume "/etc/shadow:/etc/shadow:ro" \
	--volume "/etc/sudoers.d:/etc/sudoers.d:ro" \
	--volume "/tmp/.X11-unix:/tmp/.X11-unix:rw" \
	--volume "$(pwd)/$USER:$HOME:rw" \
	--privileged \
	--entrypoint bash \
	--name locosim_jupyter \
	--ulimit rtprio=98:98 \
	locosim_jupyter:0.1
