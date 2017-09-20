FROM ubuntu:latest
MAINTAINER Juan Vivero "jsviveroj@unal.edu.co"
RUN apt-get update -y
RUN apt-get install -y python-pip python-dev build-essential
COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install requests
RUN pip install Flask-JWT
RUN pip install Flask-SQLAlchemy
RUN apt-get update
RUN echo mysql-server mysql-server/root_password password 123 | debconf-set-selections
RUN echo mysql-server mysql-server/root_password_again password 123 | debconf-set-selections
RUN apt-get -y install mysql-server
RUN apt-get -y install python-mysqldb
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf
ENTRYPOINT ["python"]
CMD ["session.py"]
