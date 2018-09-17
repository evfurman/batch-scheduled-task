FROM williamyeh/ansible:alpine3

COPY hosts.ini /root/hosts.ini
COPY batch-scheduled-task.yml /root/batch-scheduled-task.yml

WORKDIR /root/

CMD ansible-playbook /root/batch-scheduled-task.yml --inventory-file=/root/hosts.ini
