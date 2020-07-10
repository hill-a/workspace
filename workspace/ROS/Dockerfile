FROM ros:kinetic-robot-xenial

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
	apt-get install -y build-essential cmake git libboost-dev python python-pip g++-7 libopenblas-dev liblapack-dev liblapacke-dev wget python-tk && \
    python2 -m pip install --upgrade pip && \
    python2 -m pip install pandas seaborn numpy matplotlib

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
