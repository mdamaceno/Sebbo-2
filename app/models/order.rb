class Order < ActiveRecord::Base
  belongs_to :user

  enum payment_method: {
    'cc' => 0, 'bb' => 1, 'db' => 2
  }
    enum status: {
    'Processando' => 0, 'Em análise' => 1, 'Confirmado' => 2,
    'Com transportadora' => 3, 'Entregue' => 4, 'Cancelado' => 5
  }
end
