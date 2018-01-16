FROM ruby:2.4.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /short_url
WORKDIR /short_url
COPY Gemfile /short_url/Gemfile
COPY Gemfile.lock /short_url/Gemfile.lock
RUN bundle install
COPY . /short_url
