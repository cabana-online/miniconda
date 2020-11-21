FROM cabanaonline/ubuntu:1.0

# Metadata
LABEL base.image="cabanaonline/ubuntu"
LABEL description="A mini conda container"
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

ARG USER=cabana
ENV HOME /home/$USER

RUN \
    cd /tmp && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    bash Miniconda3-latest-Linux-x86_64.sh -b

# Changes work user.
USER cabana
