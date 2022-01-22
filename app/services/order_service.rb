class OrderService

  def create_order(params,uid)

    # validate param using a function

  	order = Order.new()
  	order.user_id = uid

  	order_total = 0

  	OrderItem.transaction do
  		params[:items].each do | item |
  	 		#Validations
  		 	order_item = OrderItem.new()
  		 	order_item.price = item[:price]
  		 	order_item.quantity = item[:quantity]
  		 	order_item.catalog_id = item[:catalog_id]
  		 	order_item.order = order

  			catalog = SellerCatalog.find(item[:catalog_id])
  			order_total += item[:quantity].to_i * item[:price].to_i
  			catalog.quantity = catalog.quantity - item[:quantity].to_i
        catalog.save!

  			order_item.save!
        order.order_items << order_item
  		end
  		order.total = order_total
      order.save!
  	end
  end

  def validate_order(params)
    raise ValidationError.new("Cannot create order with 0 item") if params[:items].blank?
  end
end
