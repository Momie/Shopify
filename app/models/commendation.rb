class Commendation < ActiveRecord::Base

	####### RELATIONS ##########
	belongs_to :shop ,foreign_key: "shop_id"
	############################
end
