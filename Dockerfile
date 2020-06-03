FROM python:3.8-slim-buster

RUN apt-get -y update
RUN apt-get -y upgrade
RUN mkdir /usr/share/man/man1/ #https://github.com/geerlingguy/ansible-role-java/issues/64
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-11-jdk unzip lsb-release
RUN mkdir /code
RUN mkdir /javalib
ADD requirements.txt /code/
RUN python3 -m pip install -r /code/requirements.txt
ADD backend /code/
RUN cd /javalib; unzip /code/legacy/Individiual\ NITW\ Project\ Library.zip

RUN lsb_release -a
