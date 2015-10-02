ShopifyApp.configure do |config|
  

  config.api_key = [API_KEY]
  config.secret = [SECRET_KEY]


  
  config.scope = "read_orders, read_products, read_customers"
  config.embedded_app = true
  config.routes = false
end
