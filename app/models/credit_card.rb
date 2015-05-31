class CreditCard
  include ActiveModel::Model
  attr_accessor :card_number, :code, :client_name, :expiration, :quota, :value, :client_id

end
