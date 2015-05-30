class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :term
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :searches, :users
  end
end
