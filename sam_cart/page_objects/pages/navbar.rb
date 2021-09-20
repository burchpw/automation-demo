class Navbar < SitePrism::Page
  element :dashboard, 'a[href="/dashboard/"]'
  element :products, 'a[href="/dashboards/products"]'
end