FROM centos:latest
#RUN yum -y install sssd-client
#RUN yum install -y python-pip
#ENV PATH /app/anaconda3/bin:$PATH
#RUN /bin/bash -c "source ~/.bashrc"

RUN yum -y install gcc openssl-devel bzip2-devel
WORKDIR /usr/src
RUN yum -y install sqlite-devel
RUN yum -y install libsqlite3x-devel
RUN yum -y install  gcc-c++
RUN yum -y install zlib zlib-devel
RUN  yum -y install libffi-devel
RUN yum install -y wget
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz

RUN    tar xzf Python-3.7.0.tgz
WORKDIR /usr/src/Python-3.7.0
##RUN yum -y install https://centos7.iuscommunity.org/ius-release.rpm
RUN ./configure --enable-optimizations
RUN yum -y  install make
RUN make install
#RUN yum -y install yum-utils && \
#    yum -y groupinstall development && \
#    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
#     yum -y install python37u
#RUN mv /usr/bin/python /usr/bin/python2
#RUN mv /usr/bin/python3 /usr/bin/python

#RUN yum -y install libsqlite3x-devel
#RUN ln -s /opt/python3/bin/python3.7 /usr/bin/python3.7
#RUN yum install -y python3 python3-dev
RUN pip3.7 install --upgrade pip
RUN pip3.7 install  --upgrade jupyterhub==0.9.4
RUN pip3.7 install  --upgrade notebook==5.0
RUN pip3.7 install --upgrade tornado==4.5.3
RUN pip3.7 install  --upgrade pyzmq
RUN pip3.7 install --upgrade ipykernel>=5.0
RUN useradd -m pa
ENV HOME=/home/pa
RUN chmod 777 $HOME
#WORKDIR $HOME

RUN chown pa:100 $HOME

USER pa
#RUN yum -y install sssd-client
