FROM maven:alpine

LABEL Maintainer="andres@codehunters.io"
LABEL Description="Docker image for aws beanstalk deployment" Vendor="Codehunters IO" Version="1.0"

ARG AWS_VERSION=1.16.116

RUN apk -v --update add \
        python \
        py-pip \
        && \
    pip install --upgrade awscli==$AWS_VERSION python-magic && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*

COPY awseb-entrypoint.sh /awseb-entrypoint.sh

RUN ln -fs /awseb-entrypoint.sh /usr/local/bin/awseb
RUN chmod +x /usr/local/bin/awseb