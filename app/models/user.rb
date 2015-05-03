class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Carrierwave
  mount_uploader :avatar, UserUploader

  # Relationships
  has_many :products
  has_many :addresses
  accepts_nested_attributes_for :addresses, allow_destroy: true

  # Authorization over the pages
  enum group: {
    'Administrador' => 0, 'Vendedor' => 1, 'Cliente' => 2
  }

  after_initialize :set_default_group, if: :new_record?

  def set_default_group
    self.group ||= 'Cliente'
  end
end
