class ProductCategoryController < ApplicationController
def index
  	@product_category = ProductCategory.all
  	render json: @product_category
  end

  def create
  	@product_category = ProductCategory.new(user_params)
  	if @product_category.save!
  		render json: @product_category
  	else
  		render error: { error: "Error occured in creating Product Category"} , status: 400
  	end
  end

  def show
  	@product_category = ProductCategory.find(params[:id])
  	render json: @product_category
  end

  private
  	def user_params
  		params.require(:product_category).permit(:name)
  	end
end
