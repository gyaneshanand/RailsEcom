class User < ApplicationRecord

	has_secure_password
	has_one_time_password

	validates :name, presence: true

	has_many :catalogs , class_name: 'SellerCatalog'
  	has_many :products , through: :catalogs

  	has_many :orders

    has_many :comments , as: :commentable

  	enum user_type: { seller: 0, buyer: 1}
end
