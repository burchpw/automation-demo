class DashboardPage < SitePrism::Page
  set_url '/dashboard'
  load_validation { has_gross_sales_filters? }

  element :gross_sales_filters, 'div[class="btn-group"]'

  def total_button
    Capybara.find_button('Total')
  end

  def one_time_button
    Capybara.find_button('One-Time')
  end

  def recurring_button
    Capybara.find_button('Recurring')
  end
end