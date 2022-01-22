class ProductController < ApplicationController
  def index
  	@products = Product.filters(params)
    # @products = Product.where(nil)
    # @products = @products.filter_by_product_name(params[:name]) if params[:name].present?
  	@products = @products.joins(:catalogs).select("product_id, products.name, sum(quantity) as total_q").group("product_id,products.name").page(page).per(per_page)
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save!
  		render json: @product
  	else
  		render error: { error: "Error occured in creating product"} , status: 400
  	end
  end

  def show
  	@product = Product.find(params[:id])
  	@sellers = @product.catalogs.order("price ASC")
  	#render json: @product
  end

  private
  	def product_params
  		params.require(:product).permit(:name,:unit,:product_category_id)
  	end

  	def page
  		@page ||= params[:page] || 1
  	end

  	def per_page
  		@per_page ||= params[:per_page] || 2
  	end
end
