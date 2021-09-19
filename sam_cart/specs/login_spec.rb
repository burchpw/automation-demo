require_relative '../spec_helper.rb'

describe 'test', type: :feature do

  it 'logins into the app' do
    pages = Pages.new
    pages.login_page.load

    pages.login_page.email.send_keys $email
    pages.login_page.password.send_keys $password
    pages.login_page.login_button.click

    pages.dashboard_page.loaded?
    expect(pages.dashboard_page.total_button.visible?).to be true
  end
end