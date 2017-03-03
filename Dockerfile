FROM ubuntu:14.04
MAINTAINER Sascha Ishikawa <ishikawa@rand.org>
WORKDIR /ipython-docker

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y upgrade && \
    apt-get install --no-install-recommends -y ca-certificates sudo git curl bash-completion vim-tiny make g++ gcc supervisor

# install python
RUN curl -O https://repo.continuum.io/archive/Anaconda2-4.3.0-Linux-x86_64.sh
RUN chmod +x Anaconda2-4.3.0-Linux-x86_64.sh && bash Anaconda2-4.3.0-Linux-x86_64.sh -b

# install rhodium...
# ..................

ADD ./ /ipython-docker

EXPOSE 8888

#CMD ["/usr/bin/supervisord", "-n"]
CMD ["/root/anaconda2/bin/jupyter", "notebook", "--port=8888", "--no-browser"]
