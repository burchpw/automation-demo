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
COPY ./sam_cart/credentials/encpyted_credentials.yml ./sam_cart/credentials/encpyted_credentials.yml
COPY ./sam_cart/helpers ./sam_cart/helpers
COPY ./sam_cart/page_objects ./sam_cart/page_objects
COPY ./sam_cart/specs ./sam_cart/specs
COPY ./sam_cart/spec_helper.rb ./sam_cart/spec_helper.rb

#Make Setup script executable
RUN chmod +x setup.sh

CMD ["bash" "setup.sh"]