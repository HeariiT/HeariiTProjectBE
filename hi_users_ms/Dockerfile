FROM ruby:2.3
RUN mkdir /hi_users_ms
WORKDIR /hi_users_ms
ADD Gemfile /hi_users_ms/Gemfile
ADD Gemfile.lock /hi_users_ms/Gemfile.lock
RUN bundle install
ADD . /hi_users_ms