FROM ubuntu:16.04

# https://docs.docker.com/engine/examples/running_ssh_service/

RUN apt-get update && apt-get install -y openssh-server nano curl iputils-ping python3-pip
RUN mkdir /var/run/sshd
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "export LC_ALL=C" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
