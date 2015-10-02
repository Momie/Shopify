class HomeController < ApplicationController
  around_filter :shopify_session
  before_action :set_shop
  layout 'embedded_app'

  def index
    redirect_to :snippet
  	#render :text => ShopifyAPI::Shop.current.id
    # @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
    #render :text=>ShopifyAPI::Product.find(1505399749).to_json# 1172684933
    #render :text=>ShopifyAPI::Customer.find(1172684933).to_json
    #begin rescue if not accept scope 
  end

  def snippet
  end
  
  def recommendation
     @commendations = $shop.commendations
  	 #@commendations = Commendation.all
  end

  def customers
    @commendations = $shop.commendations.group_by(&:customer_id)
    @customers = ShopifyAPI::Customer.find(:all)
  end

  def customer
    @customer = ShopifyAPI::Customer.find(params[:id])
    @commendations = $shop.commendations.where(:customer_id=>params[:id])

  end


  def set_shop
    $shop = Shop.find_by_shopify_domain(ShopifyAPI::Shop.current.domain)
    @nb_recomendation = $shop.commendations.count
    @nb_customers = ShopifyAPI::Customer.count
  end

end
