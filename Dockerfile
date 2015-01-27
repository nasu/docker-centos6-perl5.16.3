FROM centos:6
MAINTAINER NASU,Tatsuya <tatu.nasu@gmail.com>
RUN yum -y update
RUN yum -y install perl
RUN yum -y install tar bzip2
RUN yum -y install gcc
RUN yum -y install man
RUN yum clean all

ENV SHELL /bin/bash
ENV PERLBREW_ROOT /root/perl5/perlbrew
ENV PERLBREW_HOME /root/.perlbrew
ENV PERLBREW_PATH /root/perl5/perlbrew/bin

RUN curl -L http://install.perlbrew.pl | bash
ENV PATH ${PERLBREW_PATH}:${PATH}
RUN perlbrew install --notest 5.16.3
RUN source ${PERLBREW_ROOT}/etc/bashrc
RUN perlbrew switch perl-5.16.3
RUN perl --version
#RUN perlbrew install-cpanm
#RUN cpanm --notest --quiet Carton
#RUN cpanm --notest --quiet Plack
#CMD perl --version; plackup -v
