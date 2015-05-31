class Order < ActiveRecord::Base
  belongs_to :user
  has_many :product_orders

  enum freight_type: {
    'pac' => 0, 'sedex' => 1
  }
  enum status: {
    'Processando' => 0, 'Em análise' => 1, 'Confirmado' => 2,
    'Com transportadora' => 3, 'Entregue' => 4, 'Cancelado' => 5,
    'Verificar com a operadora' => 6
  }

  def total(id)
    ProductOrder.select(
      'product_orders.id, product_orders.price, product_orders.quantity,
      orders.freight_price'
    ).where(order_id: id).joins(:order).sum(
      'product_orders.price * product_orders.quantity + orders.freight_price'
    )
  end
end
