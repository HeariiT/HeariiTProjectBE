FROM ruby:2.3
RUN mkdir /signup_ms
WORKDIR /signup_ms
ADD Gemfile /signup_ms/Gemfile
ADD Gemfile.lock /signup_ms/Gemfile.lock
RUN bundle install
ADD . /signup_ms