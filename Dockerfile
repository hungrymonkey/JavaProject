FROM python:3.8-slim-buster

RUN mkdir /code
ADD requirements.txt /code/
RUN python3 -m pip install -r /code/requirements.txt
ADD . /code/

