FROM python:3
ENV PYTHONUNBUFFERED 1

RUN apt-get update
RUN apt-get install -y python python-pip python-dev
RUN apt-get install -y libxml2-dev libxslt-dev libffi-dev libssl-dev
RUN apt-get install -y libmysqlclient-dev

RUN mkdir /cover_upload_ms
WORKDIR /cover_upload_ms
ADD requirements.txt /cover_upload_ms/
RUN pip install -r requirements.txt
ADD . /cover_upload_ms/