class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :field1
      t.string :field2
      t.string :field3
      t.string :field4
      t.string :city
      t.string :state
      t.string :postalcode
      t.references :user, index: true
      t.integer :created_by
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
    add_foreign_key :addresses, :users
  end
end
