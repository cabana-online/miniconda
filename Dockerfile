FROM cabanaonline/ubuntu:1.0

# Metadata
LABEL base.image="cabanaonline/ubuntu"
LABEL description="A mini conda container with bioconda"
LABEL maintainer="Alejandro Madrigal Leiva"
LABEL maintainer.email="me@alemadlei.tech"

ARG USER=cabana
ENV HOME /home/$USER

RUN \
    cd /tmp && \
    wget https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh  && \
    bash Miniconda2-latest-Linux-x86_64.sh -b -p $HOME/tools/miniconda2 && \
    rm -f Miniconda2-latest-Linux-x86_64.sh;

# Adds the package to the path for easy access.
ENV PATH="${HOME}/tools/miniconda2/bin:${PATH}"

# Adds bioconda channels.
RUN \
    conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge;

# Entrypoint to keep the container running.
ENTRYPOINT ["tail", "-f", "/dev/null"]

