FROM ruby:2.3
MAINTAINER Luis Ernesto Gil Castellanos <luegilca@unal.edu.co>

RUN mkdir /upload_ms
WORKDIR /upload_ms

ADD Gemfile /upload_ms/Gemfile
ADD Gemfile.lock /upload_ms/Gemfile.lock

RUN bundle install
ADD . /upload_ms