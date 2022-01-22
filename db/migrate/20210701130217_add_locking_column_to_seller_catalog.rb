class AddLockingColumnToSellerCatalog < ActiveRecord::Migration[6.0]
  def change
  	add_column :catalogs, :lock_version, :integer
  end
end
