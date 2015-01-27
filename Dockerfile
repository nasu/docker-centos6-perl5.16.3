FROM centos:6
MAINTAINER NASU,Tatsuya <tatu.nasu@gmail.com>
RUN yum -y update
RUN yum -y install perl perl-core
RUN yum -y install tar bzip2
RUN yum -y install gcc
RUN yum clean all
 
 RUN curl -L http://install.perlbrew.pl | bash
 ENV PATH /root/perl5/perlbrew/bin:${PATH}
 RUN perlbrew install --notest 5.16.3
 RUN perlbrew use 5.16.3
 RUN perlbrew install-cpanm
 RUN cpanm Carton
 RUN cpanm Plack
 CMD plackup -v
