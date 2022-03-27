require_relative '../../spec_helper.rb'

describe 'test', type: :feature do
  include Login

  before(:each) do
    @pages = Pages.new
    load_credentials
  end

  it "log's into the app" do
    @pages.login_page.load

    @pages.login_page.email.send_keys @email
    @pages.login_page.password.send_keys @password
    @pages.login_page.login_button.click

    @pages.dashboard_page.loaded?
    expect(@pages.dashboard_page.total_button.visible?).to be true
  end

  it "log's into the app failure test" do
    @pages.login_page.load

    @pages.login_page.email.send_keys @email
    @pages.login_page.password.send_keys @password
    @pages.login_page.login_button.click

    @pages.dashboard_page.loaded?
    expect(@pages.dashboard_page.total_button.visible?).to be false
  end
end