FROM ubuntu:14.04
MAINTAINER Sascha Ishikawa <ishikawa@rand.org>
WORKDIR /ipython-docker

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install --no-install-recommends -y \
    ca-certificates \
    sudo \
    git \
    curl \
    bash-completion \
    vim-tiny \
    make \
    g++ \
    gcc \
    r-base \
    supervisor \
    python-setuptools \
    graphviz

# install python
RUN curl -O https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh && \
  chmod +x Anaconda2-4.3.0-Linux-x86_64.sh && bash Anaconda2-4.3.0-Linux-x86_64.sh -b

ADD ./ /ipython-docker

EXPOSE 8888

# configure and start ipython notebook server
CMD ./config.sh && sh -c "/root/anaconda2/bin/jupyter notebook --ip=*"
