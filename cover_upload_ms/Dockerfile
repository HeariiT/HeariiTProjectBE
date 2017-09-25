FROM ruby:2.3
RUN mkdir /cover_upload_ms
WORKDIR /cover_upload_ms
ADD Gemfile /cover_upload_ms/Gemfile
ADD Gemfile.lock /cover_upload_ms/Gemfile.lock
RUN bundle install
ADD . /cover_upload_ms