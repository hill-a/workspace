FROM ubuntu:xenial

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
	apt-get install -y build-essential cmake git libboost-dev python3 python3-pip g++-7 libopenblas-dev liblapack-dev liblapacke-dev wget python3-tk && \
    python3 -m pip install --upgrade pip && \
    python3 -m pip install numpy pandas matplotlib seaborn

WORKDIR /home/

RUN mkdir temp && \
    cd temp && \
    wget bitbucket.org/eigen/eigen/get/3.3.7.tar.gz && \
    tar -xzf 3.3.7.tar.gz && \
    cd eigen-eigen-323c052e1731 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make -j8 && \
    make install && \
    cd ../../.. && \
    rm -rf temp

CMD /bin/bash
