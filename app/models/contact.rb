class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :name, :email, :subject, :message

  validates_presence_of :name
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_length_of :message, :maximum => 500

  def persisted?
    false
  end
end
