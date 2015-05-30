class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :subcategory
  belongs_to :user

  mount_uploader :cover, ProductUploader

  scope :by_term, -> (term) {
    where(
      'products.name like ? OR products.description like ?', "%#{term}%", "%#{term}%"
    )
  }
end
