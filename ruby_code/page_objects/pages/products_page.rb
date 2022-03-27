class ProductsPage < SitePrism::Page
  set_url '/dashboards/products'
  load_validation {has_new_product_button?}

  element :new_product_button, 'button[class*="btn add-product-button"]'

  section :new_product_slide_out, 'div[class="modal-dialog slideInPaneModal slide-in-pane-holder bg-white modal-dialog-scrollable"]' do
    element :product_name, 'input[name="name"]'
    element :product_description, 'textarea[name="description"]'
    element :product_pricing_type, 'select[name="pricingType"]'
    element :product_price, 'input[name="price"]'
    element :create_product, 'button[class*="create-product"]'
  end
end