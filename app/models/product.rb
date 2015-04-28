class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user
end
