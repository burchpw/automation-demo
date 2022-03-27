require_relative '../../spec_helper.rb'

describe 'Add product', type: :feature do
  include Login

  before(:each) do
    @pages = Pages.new
    load_credentials
    login
  end

  it 'Creates a new product' do
    @pages.navbar.products.click
    @pages.products_page.loaded?
    @pages.products_page.new_product_button.click
    @pages.products_page.new_product_slide_out.product_name.send_keys "test product #{Time.now.to_s}"
    @pages.products_page.new_product_slide_out.product_description.send_keys "test product description"
    @pages.products_page.new_product_slide_out.product_pricing_type.select 'Pay what you want'
    @pages.products_page.new_product_slide_out.product_price.send_keys "1.00"
    @pages.products_page.new_product_slide_out.create_product.click

    expect(@pages.edit_product_page.share_this_product.visible?).to be true
  end
end