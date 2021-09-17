require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'

RSpec.configure do |config|

  Capybara.register_driver :firefox do |app|
    Capybara::Selenium::Driver.new(app,
                                   :browser => :remote,
                                   :desired_capabilities => :firefox,
                                   :url => "http://host.docker.internal:4444/wd/hub"
    )
    Capybara.host
  end

end