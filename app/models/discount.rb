class Discount < ActiveRecord::Base

  TYPES = [ 'Porcentagem', 'Moeda' ]
  enum type_d: TYPES
end
