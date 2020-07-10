#!/usr/bin/env bash

ATOM_VERSION="1.40.1"
ARCH="amd64"

# if atom not found in working directory: download it and extract it
if [ ! -d "./atom-${ATOM_VERSION}-${ARCH}" ]; then
    echo "Atom editor not found, downloading it with config..."
    curl -L "https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom-${ARCH}.tar.gz" | tar -xz
    curl -Lo temp.tar.gz https://github.com/hill-a/atom-config/tarball/master
    tar --wildcards --strip-components=1 -xzf temp.tar.gz */.atom
    rm -rf temp.tar.gz
fi

# if work env not found in working directory: download it and extract it
if [ ! -d "./workspace" ]; then
    echo "Workspace not found, downloading from git..."
#    curl -L https://github.com/hill-a/workspace/tarball/master | tar --wildcards --strip-components=1 -xzf temp.tar.gz */workspace
fi

# if docker not found: get the install docker script and run it
if ! hash docker 2>/dev/null; then
    echo "Docker not found, installing from web script..."
    curl -Ls https://get.docker.com/ | sh
fi

./atom-${ATOM_VERSION}-${ARCH}/atom
