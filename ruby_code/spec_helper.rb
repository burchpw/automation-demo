require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'capybara-screenshot/rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'site_prism/all_there'
require 'yaml'
require_relative 'page_objects/pages'

Dir[File.dirname(__FILE__) + '/helpers/*.rb'].each {|file| require file }

RSpec.configure do |config|

  config.include Capybara::DSL

  config.before(:example, type: :feature) do
    if ENV["DOCKER_COMPOSE"]
      url = "http://automation-demo_#{ENV["BROWSER"]}_1:4444/wd/hub"
    else
      url = 'http://0.0.0.0:4445/wd/hub'
    end
      Capybara.register_driver :remote_docker do |app|
        caps = Selenium::WebDriver::Remote::Capabilities.send(ENV["BROWSER"].to_sym)
        Capybara::Selenium::Driver.new(app,
                                       :browser => :remote,
                                       :desired_capabilities => caps,
                                       :url => url
        )
      end



    Capybara::Screenshot.register_driver(:remote_docker) do |driver,path|
      driver.browser.save_screenshot(path)
    end
    Capybara::Screenshot.autosave_on_failure = true

    Capybara.app_host = 'https://samcart.com/'
    Capybara.run_server = false
    Capybara.default_max_wait_time = 30
    Capybara.save_path = './test_results/screen_shot'
    Capybara.current_driver = :remote_docker
  end

  config.append_after(:example, type: :feature) do
    Capybara.reset_sessions!
  end

end