class Shop < ActiveRecord::Base

	####### RELATIONS ##########
	has_many :commendations ,foreign_key: "shop_id"
    accepts_nested_attributes_for :commendations 

    ##########################
  include ShopifyApp::Shop
end
