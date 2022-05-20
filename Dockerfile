FROM python:3

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apt update; \
    apt install curl
RUN curl -sL https://aka.ms/InstallAzureCLIDeb |  bash

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible; \
    ansible-galaxy collection install azure.azcollection; \
    pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt
