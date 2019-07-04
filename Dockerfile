FROM ruby:2.5.1

# Creates Application root
RUN mkdir -p /test-marvel-api
WORKDIR /test-marvel-api

# Ensure gems are cached and only get updated when they change
COPY Gemfile Gemfile.lock /test-marvel-api/
RUN bundle install

# Copy aplication code from local
COPY . /test-marvel-api

CMD rspec