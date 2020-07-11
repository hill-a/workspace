#!/usr/bin/env bash
set -e

ATOM_VERSION="1.40.1"
ARCH="amd64"

# if atom not found in working directory: download it and extract it
if [ ! -d "./atom-${ATOM_VERSION}-${ARCH}" ]; then
    echo "Atom editor not found, downloading it with config..."
    curl -L "https://github.com/atom/atom/releases/download/v${ATOM_VERSION}/atom-${ARCH}.tar.gz" | tar -xz
    # also getting the config files
    curl -Lo temp.tar.gz https://github.com/hill-a/atom-config/tarball/master
    tar --wildcards --strip-components=1 -xzf temp.tar.gz */.atom
    rm -rf temp.tar.gz
    # and setting the working directory
    echo "{\"version\":\"1\",\"windows\":[{\"projectRoots\":[\"$(pwd)/workspace\"]}]}" > ./.atom/storage/application.json
fi

# if work env not found in working directory: download it and extract it
if [ ! -d "./workspace" ]; then
    echo "Workspace not found, downloading from git..."
    curl -L https://github.com/hill-a/workspace/tarball/master | tar --wildcards --strip-components=1 -xz */workspace
fi

# if docker not found: get the install docker script and run it
# this does not need root to install, however the user will need to be in the docker groupe to use docker
if ! hash docker 2>/dev/null; then
    echo "Docker not found, installing from web script..."
    curl -Ls https://get.docker.com/ | sh
fi

# All done, starting atom
./atom-${ATOM_VERSION}-${ARCH}/atom
