FROM continuumio/anaconda3:2020.02

RUN apt-get update && \
    apt-get install -y build-essential cmake git jq libfontconfig1 libglib2.0-0 libsm6 libxext6 libxrender1 libopenmpi-dev zlib1g-dev

WORKDIR /home/

RUN mkdir ./stable-baselines
COPY ./stable-baselines/setup.py ./stable-baselines/setup.py

RUN python -m pip install --upgrade pip && \
    cd stable-baselines && \
    pip install -e .[mpi,tests,docs] && \
    cd .. && \
    rm -rf stable-baselines

CMD /bin/bash
