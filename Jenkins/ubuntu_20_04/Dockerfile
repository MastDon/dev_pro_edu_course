FROM ubuntu:20.04

USER root

RUN   apt-get -q -y update; apt-get -q -y upgrade && \
      apt-get -q -y install sudo openssh-server && \
      apt install -y python3 && \
      apt install python3-pip -y && \
      pip3 install ansible --upgrade && \
      mkdir /root/.ssh && \
      chmod 700 /root/.ssh && \
      mkdir /var/run/sshd && \
      mkdir /root/git_repo && \
      apt install software-properties-common apt-transport-https -y && \
      add-apt-repository ppa:openjdk-r/ppa -y && \
      apt install openjdk-8-jdk -y && \
      apt install curl -y && \
      curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -  && \
      apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"  && \
      apt update  && \
      apt install awscli -y  && \
      apt install terraform -y  && \
      apt install git -y   && \
      apt install nano -y && \
      apt install python3-boto3 -y && \
      apt-get -y install python3-distutils && \
      ansible-galaxy collection install amazon.aws && \
      rm -rf /var/lib/apt/lists/*


      COPY ubuntu-ssh.pub /root/.ssh/authorized_keys




CMD /usr/sbin/sshd -D