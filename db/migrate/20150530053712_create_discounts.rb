class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.string :code
      t.float :value
      t.integer :type_d

      t.timestamps null: false
    end
  end
end
