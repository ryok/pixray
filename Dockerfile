FROM nvcr.io/nvidia/pytorch:21.06-py3

ENV DIFFVG_CUDA 1

RUN apt update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    libgl1-mesa-dev \
    ffmpeg

WORKDIR /

RUN git clone https://github.com/pixray/pixray
RUN git clone https://github.com/pixray/v-diffusion-pytorch

RUN git clone https://github.com/BachiLi/diffvg
WORKDIR /diffvg
RUN git submodule update --init --recursive
RUN python setup.py install

ADD requirements_docker.txt /tmp
RUN pip install -r /tmp/requirements_docker.txt
RUN pip install --upgrade numpy

WORKDIR /workspace