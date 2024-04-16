FROM ruby:3.2.2

WORKDIR /app

COPY . .

RUN apt-get update -qq && \
    apt-get install -y nodejs && \
    apt-get install -y postgresql-client

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && \
   bundle install --with development test

CMD ["rails", "server", "-b", "0.0.0.0"]:
