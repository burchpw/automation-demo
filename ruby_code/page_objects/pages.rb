Dir[File.dirname(__FILE__) + '/pages/*.rb'].each {|file| require file }

class Pages

  def login_page
    LoginPage.new
  end

  def navbar
    Navbar.new
  end

  def dashboard_page
    DashboardPage.new
  end

  def products_page
    ProductsPage.new
  end

  def edit_product_page
    EditProductPage.new
  end
end