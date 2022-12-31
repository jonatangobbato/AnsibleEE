FROM quay.io/ansible/awx-ee:latest

USER root

# add Python dependencies and Ansible
# Galary dependencies
ADD requirements.yml /tmp/requirements.yml
ADD requirements.txt /tmp/requirements.txt

# upgrade pip
RUN /usr/bin/python3 -m pip install --upgrade pip

# install Ansible Galaxy collections
RUN ansible-galaxy collection install -r /tmp/requirements.yml --collections-path /usr/share/ansible/collections

# install Python dependencies
RUN pip install -r /tmp/requirements.txt

USER 1000
