FROM gorenje/ruby1.9:1.9.2p320
WORKDIR /usr/src/app
ENV LANG C.UTF-8
COPY Gemfile .
COPY Gemfile.lock .
COPY . .
COPY config/database.docker.yml config/database.yml
COPY config/apis.docker.yml config/apis.yml
RUN apk update && apk upgrade && apk add g++ && apk add mysql-dev
RUN gem install bundler
RUN bundle config git.allow_insecure true
RUN bundle install --jobs 8 --retry 3
CMD ["bundle", "exec", "rails", "s"]
