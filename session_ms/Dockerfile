FROM ubuntu:latest
MAINTAINER Juan Vivero "jsviveroj@unal.edu.co"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
pip install requests
pip install Flask-JWT
pip install Flask-SQLAlchemy
RUN "mysql -u root --password="123""
RUN "create database session_db;"
ENTRYPOINT ["python"]
CMD ["session.py"]
