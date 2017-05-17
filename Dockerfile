FROM centos:latest
MAINTAINER Patrick Springer
LABEL description="Git Client"

RUN yum -y update \
    && yum update -y \
    && yum groupinstall -y "Development tools" \
    && yum install -y tar wget m4 \
    && yum install -y autoconf \
    && yum install -y gcc \
    && yum install -y perl-ExtUtils-MakeMaker \
    && yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
    && yum clean all \
    && wget https://www.kernel.org/pub/software/scm/git/git-1.9.4.tar.gz \
    && tar xzf git-1.9.4.tar.gz \
    && cd git-1.9.4 \
    && make prefix=/usr/local/git all \
    && make prefix=/usr/local/git install \
    && echo "export PATH=$PATH:/usr/local/git/bin" >> /etc/bashrc \ 
