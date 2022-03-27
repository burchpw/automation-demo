module Login
  def load_credentials
    credentials = YAML::load_file(File.join(__dir__, '../credentials/credentials.yml'))
    @email = credentials['email']
    @password = credentials['password']
  end

  def login
    @pages.login_page.load
    @pages.login_page.email.send_keys @email
    @pages.login_page.password.send_keys @password
    @pages.login_page.login_button.click
    @pages.dashboard_page.loaded?
  end
end