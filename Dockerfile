FROM ubuntu:16.04

RUN apt-get update && apt-get install -y openssh-server 
RUN mkdir /var/run/sshd
RUN echo 'root:redhat' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN apt-get install ansible -y && apt-get install sshpass -y 
RUN mkdir /ansible 
RUN echo "[local]" >> /etc/ansible/hosts && echo "localhost" >> /etc/ansible/hosts
RUN echo "[local:vars]" >> /etc/ansible/hosts && echo "ansible_ssh_host=localhost" >> /etc/ansible/hosts && echo "ansible_ssh_user=root" >> /etc/ansible/hosts && echo "ansible_ssh_pass=redhat" >> /etc/ansible/hosts && echo "[defaults]" >> /etc/ansible/ansible.cfg && echo "host_key_checking = false" >> /etc/ansible/ansible.cfg 

WORKDIR /ansible/play
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
