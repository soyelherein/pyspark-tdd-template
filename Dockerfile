FROM ubuntu:18.04

ENV LANG=C.UTF-8

WORKDIR /usr/src/app
COPY . .

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -q -y openjdk-8-jdk && \
    apt-get install -y python3-pip python3.7-dev libkrb5-dev zip

RUN pip3 install --upgrade pip && \
    pip3 install \
    pipenv 

RUN pipenv install --dev
RUN pipenv run pytest
