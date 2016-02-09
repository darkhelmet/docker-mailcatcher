FROM ruby:2.3.0-slim
MAINTAINER Daniel Huckstep <danielh@getyardstick.com>

ENV MAILCATCHER_VERSION 0.6.1

RUN gem install mailcatcher --version $MAILCATCHER_VERSION

EXPOSE 1080 1025

CMD mailcatcher --foreground --verbose --ip 0.0.0.0
