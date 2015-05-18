class CreateProductOrders < ActiveRecord::Migration
  def change
    create_table :product_orders do |t|
      t.string :name
      t.float :price
      t.text :description
      t.integer :quantity
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_orders, :orders
  end
end
