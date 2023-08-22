FROM debian:bookworm

RUN apt update && \
    apt install -y pipenv && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -m -s /bin/bash ansible && \
    mkdir /opt/ansible

COPY Pipfile /opt/ansible
COPY Pipfile.lock /opt/ansible

RUN cd /opt/ansible && \
    PIPENV_VENV_IN_PROJECT=1 pipenv install --ignore-pipfile

USER ansible
ENV PATH="${PATH}:/opt/ansible/.venv/bin/"
