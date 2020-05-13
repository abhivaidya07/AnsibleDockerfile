# ansible_dockerfile
# AnsibleDockerfile
MOVE TO FOLDER WHERE DOCKERFILE AND PLAY FOLDER IS PRESENT AND RUN FOLLOWING COMMANDS:

docker build -t ansible .

This command build the docker image with name as ansible (you can also pull docker image from abhishekvaidya/ansible:latest)

docker run -d -P --name=ansible -v /root/project/play:/ansible/play:Z ansible

This command run the image with volume attach to it and name as ansible . "play" folder contains playbooks inventory and ansible.cfg file , if not provided then it uses default configuration where playbook runs on localhost.In inventory file you have to provide the user, password and host ip.

docker exec -it ansible ansible-playbook file_name.yml

This command runs the playbook in the container or remote host depending on inventory. This command also shows the output of the yaml file. 
