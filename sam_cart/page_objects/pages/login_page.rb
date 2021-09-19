class LoginPage < SitePrism::Page
  set_url '/auth/login'

  element :email, 'input[name="email"]'
  element :password, 'input[name="password"]'

  def click_login_button
    Capybara.find_button('Log in').click
  end
end