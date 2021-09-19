require_relative '../spec_helper.rb'

describe 'test', type: :feature do

  it 'loads login page' do
    pages = Pages.new
    pages.login_page.load

    pages.login_page.email.send_keys $email
    pages.login_page.password.send_keys $password
    pages.login_page.click_login_button
  end
end