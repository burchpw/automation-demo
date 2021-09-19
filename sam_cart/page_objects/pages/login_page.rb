class LoginPage < SitePrism::Page
  set_url '/auth/login'

  element :email, 'input[name="email"]'
  element :password, 'input[name="password"]'

  def login_button
    Capybara.find_button('Log in')
  end
end