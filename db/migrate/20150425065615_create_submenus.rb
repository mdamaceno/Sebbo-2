class CreateSubmenus < ActiveRecord::Migration
  def change
    create_table :submenus do |t|
      t.string :name
      t.string :route
      t.boolean :active
      t.references :menu, index: true
      t.integer :created_by
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
    add_foreign_key :submenus, :menus
  end
end
