FROM nvcr.io/nvidia/pytorch:21.06-py3

RUN apt update
RUN apt install -y git
RUN apt-get install libgl1-mesa-dev

WORKDIR /

RUN git clone https://github.com/pixray/pixray
RUN git clone https://github.com/pixray/v-diffusion-pytorch

RUN git clone https://github.com/BachiLi/diffvg
WORKDIR ./diffvg
RUN git submodule update --init --recursive
RUN python setup.py install

ADD myrequirements.txt /tmp
RUN pip install -r /tmp/myrequirements.txt
RUN pip install --upgrade numpy

WORKDIR /workspace