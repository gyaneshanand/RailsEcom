# json.array! @product do |product|

#   json.name product.name
#   json.sellers product.catalogs , :user_id , :price , :quantity
# end

json.array! @products do |product|

	json.name product.name
	json.pid product.product_id
	json.stock product.total_q
end

# json. :name , :unit

#json.products @product :name , :unit

#json.users @product.users , :name , :email

# json.array! @products do |product|

#   json.name product.name
#   json.x product.user_ids
#   # json.x product.user_ids
#   #json.sellers product , :user_ids , :prices , :quantity
# end