class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.integer :price
      t.integer :quantity
      t.references :order , foreign_key: true
      t.references :catalog, foreign_key: true

      t.timestamps
    end
  end
end
