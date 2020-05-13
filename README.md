# ansible_dockerfile
# AnsibleDockerfile
THIS DOCKERFILE RUNS A PLAYBOOK IN A CONTAINER.

Steps: 
MOVE TO THE FOLDER WHERE DOCKERFILE AND PLAY FOLDER IS PRESENT AND RUN FOLLOWING COMMANDS:

$ docker build -t ansible .

This command build the docker image with name as ansible (you can also pull docker image from abhishekvaidya/ansible:latest)


$ docker run -d -P --name=ansible -v /root/project/play:/ansible/play:Z ansible

This command run the image with volume attach to it and name as ansible . "play" folder contains playbooks, inventory file and ansible.cfg file , if inventory and ansible.cfg files are not provided then it uses default configuration where playbook runs on localhost. For local inventory file you have to provide the user, password and host ip on which you want to run the playbook.


$ docker ps

To check whether container is running or not 


$ docker exec -it ansible ansible-playbook file_name.yml

This command runs the playbook in the container or on remote host depending on inventory file. This command also shows the output of the yaml file.


$ ssh root@localhost -p port_no 

You can also take ssh of the container using port, mapped to container's 22 port.
