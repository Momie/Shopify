class SendmeController < ApplicationController
	
	def send_product_in_mail
	    @product = nil
	    @customer = nil
	    store = Shop.find_by_shopify_domain(params[:shop_domain])
	    session = ShopifyAPI::Session.temp(store.shopify_domain,store.shopify_token){
	    	   @shop_name = ShopifyAPI::Shop.current.myshopify_domain.gsub(".myshopify.com","")
	    	   @product = ShopifyAPI::Product.find(params[:product_id].to_i)
	    	   @customer = ShopifyAPI::Customer.find(params[:customer_id].to_i)
	    }
	    customer_name = @customer.last_name + " " + @customer.first_name
	    store.commendations.new({
	    				:mail=>params[:mail],
	    				:product_id=>params[:product_id],
	    				:product_title=>@product.title,
	    				:product_price=>@product.variants.first.price,
	    				:product_img=>@product.image.src,
	    				:product_description=>@product.body_html,
	    				:url=>params[:url],
	    				:customer=>customer_name,
	    				:customer_id=>params[:customer_id],
	    				:comment=>params[:comment]
	    				})	       #SessionStorage.retrieve(store.id)
        if /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(params[:mail]) 
        	if store.save
        		Recommend.recommend_product(params[:mail],customer_name,params[:comment],@product.title,@product.variants.first.price,@product.body_html,@product.image.src,params[:url],@shop_name).deliver_now
        	    @title = 'Well done!'
	            @msg = 'You successfully read this important alert message.'+ @product.title
	            @type = 'success'
        	else
        		@title = 'Ops!'
	            @msg = 'Pleaze Can you try later.'+ @product.title
	            @type = 'block'
        	end
        else
        	@title = 'Ops!'
	        @msg = 'Please Checked you Friend Email is invalide.'+ @product.title
	        @type = 'error'
        end
	    respond_to do |format|
    	  format.js { render 'responce.js' }
  		end
	end

end
