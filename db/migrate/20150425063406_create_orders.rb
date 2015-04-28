class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :freight_price
      t.integer :freight_type
      t.integer :payment_method
      t.integer :status
      t.string :delivery_field1
      t.string :delivery_field2
      t.string :delivery_field3
      t.string :delivery_field4
      t.string :delivery_city
      t.string :delivery_state
      t.integer :created_by
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
  end
end
