class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.string :cover
      t.text :description
      t.integer :stock
      t.boolean :active
      t.references :category, index: true
      t.references :subcategory, index: true
      t.references :user, index: true
      t.integer :created_by
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
    add_foreign_key :products, :categories
    add_foreign_key :products, :subcategories
    add_foreign_key :products, :users
  end
end
