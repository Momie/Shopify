# Shopify
Shopify Application ( product recommendation )
# Shopify Product recommendation app

This is an example application for building Shopify Embedded Applications.

The example uses Ruby on Rails as a backend framework but the Shopify Embedded API is JavaScript based, so it is backend language/framework agnostic. Use this as a reference.

For details on how embedded applications work in Shopify, how to setup your app, and the full javascript API for ShopifyApp, please consult the documentation:

http://docs.shopify.com/embedded-app-sdk
# Overview
This Shopify application adds the functionality of creating a small frontend html form which will be displayed ONLY to customers (they have already made and paid at least one order) that are logged in to the Shopify store. This app may be ready to be used in one only Shopify store or multiple Shopify stores.
The customer, once logged in, will be able to fill in certain fields of the form in order to recommend a product (via email) to a friend.

This form should have 2 fields: the email of the friend that will receive the recommendation and a text field for customer to leave a comment about that product.

A hidden field will also be sent inside the email to the friend with the absolute url of the product.

All over the document, there may be one or more references to the following actors that will play a role inside the Shopify # App:
Merchant – The store owner, the one that installs the application	in a Shopify store
Customer – The one that buys (and recommends) products from the merchant's store
Friend – The one that should receive the email with the product recommendation

# Functionalities
The merchant will have access to a back office where it is possible to configure the snippet that should be displayed to the customers in the product description page, as well as to check the recommendations that are made. The merchant back office should provide the following functionalities:

- Form configuration
Width of the fields
Border (color, size, etc)
Color of the text
Background color
Font family (for form text and button)
Button color
- Form snippet generation (that should be used by the merchant to add the functionality to the store)
- List of sent emails with the following information:
- The product that was recommended
- The customer that recommended 		
- Friend that received the recommendation
- Customer profile with the at least the following data:
Name
Email
Total of recommendations made
List of emails sent (product and friend)

The recommendation form should have a field for the email and another one for a comment/ message. As per the message received by the customer's friend, it should have the following information and be formatted in HTML, to organize the information in it:

Title containing the customer name (a good option would be “{{name_of_the_customer}} recommends you the product {{name_of_the_product}}”)
Comment/message
Product name
Product price	
Product description
Absolute Product URL



