FROM ruby:2.7.4
WORKDIR /automation-demo

#Install SOPS
ADD https://github.com/mozilla/sops/releases/download/v3.7.1/sops_3.7.1_amd64.deb /tmp/
RUN apt-get install -y --no-install-recommends /tmp/sops_3.7.1_amd64.deb

#Copy Gemfile and install gems
COPY ./Gemfile* ./
RUN gem install bundler:2.2.27
RUN bundle install

#Copy Setup File and Test Files
COPY setup.sh setup.sh
COPY ./ruby_code/credentials/encpyted_credentials.yml ./ruby_code/credentials/encpyted_credentials.yml
COPY ./ruby_code/helpers ./ruby_code/helpers
COPY ./ruby_code/page_objects ./ruby_code/page_objects
COPY ./ruby_code/specs ./ruby_code/specs
COPY ./ruby_code/spec_helper.rb ./ruby_code/spec_helper.rb

#Make Setup script executable
RUN chmod +x setup.sh

CMD ["bash" "setup.sh"]