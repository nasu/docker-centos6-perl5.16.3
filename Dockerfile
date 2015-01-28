FROM centos:6
MAINTAINER NASU,Tatsuya <tatu.nasu@gmail.com>
RUN yum -y update
RUN yum -y install perl
RUN yum -y install tar bzip2
RUN yum -y install gcc
RUN yum -y install man
RUN yum clean all

ENV HOME /root
ENV SHELL /bin/bash
ENV PERLVERSION 5.16.3
ENV PERLBREW_ROOT ${HOME}/perl5/perlbrew
ENV PERLBREW_HOME ${HOME}/.perlbrew
ENV PERLBREW_PATH ${HOME}/perl5/perlbrew/bin
RUN mkdir -p ${HOME}/bin
RUN echo "source ${PERLBREW_ROOT}/etc/bashrc &&\
    perlbrew use ${PERLVERSION} &&\
    perl $@\
    " > ${HOME}/bin/perl

RUN curl -L http://install.perlbrew.pl | bash
ENV PATH ${HOME}/bin:${PERLBREW_PATH}:${PATH}
RUN perlbrew install --notest ${PERLVERSION}
RUN ["/bin/bash", "-c", "perl --version"]
RUN ["/bin/bash", "-c",\
    "source ${PERLBREW_ROOT}/etc/bashrc;\
    perlbrew use ${PERLVERSION};\
    perl --version"]
#RUN perlbrew install-cpanm
#RUN cpanm --notest --quiet Carton
#RUN cpanm --notest --quiet Plack
#CMD perl --version; plackup -v
