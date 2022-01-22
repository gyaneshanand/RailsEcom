class OrderItem < ApplicationRecord
	belongs_to :order

	belongs_to :catalog, class_name: 'SellerCatalog'
end
