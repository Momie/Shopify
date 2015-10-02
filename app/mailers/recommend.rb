class Recommend < ApplicationMailer

	default from: %("Mhalheli Soufien" <david.garcia@microapps.com>)

	def recommend_product(email,customer_name,comment,product_name,price,product_discreption,product_img,prod_url,shop)
	  @email = email
	  @customer_name = customer_name
	  @comment = comment
	  @product_name = product_name
	  @price = price
	  @product_discreption = product_discreption
	  @product_img = product_img
	  @product_url = prod_url
	  @shop = shop
      #attachments['cv.pdf'] = File.read("#{Rails.root}/cv/CV_MHALHELI_Soufien_#{version}.pdf")
      #attachments.inline['prod.png'] = File.read(product_img)
      #mail_with_name = "Candidatire web developer"
      #email_with_name = %("Soufien Mhalheli" <mhalheli.soufien@gmail.com>)
      #@letre = lettre || ""
      mail(from: %("#{shop} Shop" <david.garcia@microapps.com>),to: email,bcc: "mhalheli.soufien@gmail.com" , subject: 'Recommend Product Shopify Store')
   end

end
