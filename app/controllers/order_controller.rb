class OrderController < ApplicationController
	def create
		# 1. Create new Order
		# 2. Create new OrderItem for each item in request
		# 3. Reduce the stock in SellerCatalog table for each item
		# 4. Wrap 2 and 3 in transaction
		# Make it modular - order service

		order =  OrderService.new.create_order(params,@user.id)
    render json: order
	end

  def index
    orders = Order.all
    render json: orders
  end

  def show
    order = Order.find(params[:id])
    render json: order
  end

	private
	  	def order_params
	  		params.permit(:items [:price , :quantity  ,:catalog_id])
	  	end
end
