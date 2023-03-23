ARG RUBYGEMS_VERSION=3.4.7
FROM ruby:3.0.5

ARG RUBYGEMS_VERSION
RUN gem install rubygems-update -v $RUBYGEMS_VERSION
RUN update_rubygems

WORKDIR /root

COPY Gemfile .
COPY Gemfile-$RUBYGEMS_VERSION.lock ./Gemfile.lock
COPY test.sh .
