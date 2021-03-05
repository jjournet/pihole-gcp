FROM gcr.io/google.com/cloudsdktool/cloud-sdk:latest
LABEL maintainer="JP Journet"

ARG APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get install -y apt-utils && \
    apt-get install -y  software-properties-common gcc python-dev libkrb5-dev && \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
    apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt-get update && apt-get install -y terraform && \
    apt-get install python3-pip && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade virtualenv && \
    pip3 install pywinrm[kerberos] && \
    apt install krb5-user -y && \ 
    pip3 install pywinrm && \
    pip3 install ansible