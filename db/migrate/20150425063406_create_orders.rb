class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :freight_price, scale: 2
      t.integer :freight_type
      t.integer :status
      t.string :delivery_field1
      t.string :delivery_field2
      t.string :delivery_field3
      t.string :delivery_field4
      t.string :delivery_city
      t.string :delivery_state
      t.references :user, index: true
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
    add_foreign_key :orders, :users
  end
end
