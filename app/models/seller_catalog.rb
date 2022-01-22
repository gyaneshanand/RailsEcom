class SellerCatalog < ApplicationRecord

	self.table_name = "catalogs"

  belongs_to :user
  belongs_to :product

  has_many :order_items , foreign_key: "catalog_id"

end
