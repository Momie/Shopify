Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify,
    ShopifyApp.configuration.api_key,
    ShopifyApp.configuration.secret,

    :scope => ShopifyApp.configuration.scope,

    :setup => lambda {|env|
       params = Rack::Utils.parse_query(env['QUERY_STRING'])
       #redirect_uri = "http://demo.herokuapp.com/"
       site_url = "https://#{params['shop']}"
       env['omniauth.strategy'].options[:client_options][:site] = site_url
    }
end
