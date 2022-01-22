class Product < ApplicationRecord
  belongs_to :product_category

  has_many :catalogs , class_name: 'SellerCatalog'
  has_many :users , through: :catalogs

  scope :filter_by_pid , -> (pid) {where(id: pid)}
  scope :filter_by_product_name , -> (name) {where(name: name)}

  scope :filters , -> (params) { 
  	result = all
  	result = result.filter_by_product_name(params[:name]) if params[:name].present?
  	result
  	}
end
