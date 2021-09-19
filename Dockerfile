FROM ruby:2.7.4
WORKDIR /automation-demo

COPY ./Gemfile* ./
RUN gem install bundler:2.2.27
RUN bundle install

COPY ./sam_cart ./sam_cart



