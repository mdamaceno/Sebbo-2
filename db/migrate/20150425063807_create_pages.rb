class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.boolean :active
      t.integer :created_by
      t.integer :updated_by
      t.integer :deactivated_by

      t.timestamps null: false
    end
  end
end
