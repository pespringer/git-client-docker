FROM centos:latest
MAINTAINER Patrick Springer
LABEL description="Git Client"

COPY ./gitInstall.sh /gitInstall.sh

RUN yum -y update \
    && yum update -y \
    && yum groupinstall -y "Development tools" \
    && yum install -y tar wget m4 \
    && yum install -y autoconf \
    && yum install -y gcc \
    && yum install -y perl-ExtUtils-MakeMaker \
    && yum install -y curl-devel expat-devel gettext-devel openssl-devel zlib-devel \
    && yum remove -y git \
    && yum clean all \
    && chmod 755 /gitInstall.sh \
    && /gitInstall.sh \
    && /gitz/bin/git-1.9.4//bin/git config --global user.email "patrick.springer@gmail.com" \
    && /gitz/bin/git-1.9.4//bin/git config --global user.name "pespringer"
