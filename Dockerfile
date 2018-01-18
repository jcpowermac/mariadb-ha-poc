FROM docker.io/centos/mariadb-102-centos7


USER root

RUN yum clean all && \
    INSTALL_PKGS="rh-mariadb102-galera which" && \
    yum install -y --setopt=tsflags=nodocs $INSTALL_PKGS && \
    rpm -V $INSTALL_PKGS && \
    yum clean all

USER 27


EXPOSE 4567 4568 4444
