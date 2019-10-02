FROM ruby:2.6.3
MAINTAINER jjs276@gmail.com

ARG RAILS_PORT

RUN apt-get update && apt-get install -y \
  build-essential \
  nodejs

RUN mkdir -p /desafio_backend
WORKDIR /desafio_backend

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

COPY . ./

RUN bundle exec rake db:setup

EXPOSE $RAILS_PORT

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
