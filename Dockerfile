FROM ruby:2.3

RUN echo "deb http://ftp.us.debian.org/debian jessie-backports main" | tee -a /etc/apt/sources.list

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN bundle install

CMD bundle exec ruby paycheck_server.rb
