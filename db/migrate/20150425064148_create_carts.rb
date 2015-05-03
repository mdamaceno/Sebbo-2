class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.references :product, index: true
      t.references :user, index: true
      t.integer :updated_by

      t.timestamps null: false
    end
    add_foreign_key :carts, :products
    add_foreign_key :carts, :users
  end
end
