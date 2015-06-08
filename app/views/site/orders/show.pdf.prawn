prawn_document(:page_layout => :landscape) do |pdf|
  order = "#{@order.id}".rjust(8, '0')

  pdf.text "Sebbo - Livros online", size: 30, style: :bold
  pdf.text "Endereço: Rua da Fantasia, 335 - Shrek - Tão Tão Distante - CEP 117789-112"
  pdf.text "CNPJ: 28.997.496/0001-15 - IE: 08889963324-45"
  pdf.text "Tel.: (32) 3266-9898"

  pdf.move_down 30

  pdf.text "Pedido nº ##{order}", size: 15, style: :bold

  pdf.move_down 30

  pdf.text "Destinatário/Remetente", size: 15, style: :bold
  pdf.text "Nome: #{@order.user.firstname} #{@order.user.lastname}"
  pdf.text "CPF: #{@order.user.doc1}"
  pdf.text "Endereço: #{@order.delivery_field1}, #{@order.delivery_field2} - #{@order.delivery_field4} - #{@order.delivery_city} - #{@order.delivery_state}"

  pdf.move_down 30

  pdf.text "Itens da nota fiscal", size: 15, style: :bold

  title1 = [
    ["ID", "Nome", "Qtd", "Preço Unit.", "Preço Total"]
  ]

  items = @order.product_orders.map do |item|
    [item.id, item.name, item.quantity, number_to_currency(item.price, unit: 'R$', separator: ",", delimiter: ""), number_to_currency(item.price * item.quantity, unit: 'R$', separator: ",", delimiter: "")]
  end

  column_w = [40, 200, 40, 80, 80]

  pdf.table(title1, column_widths: column_w)
  pdf.table(items, column_widths: column_w)

  pdf.move_down 20

  pdf.text "Tipo de frete: #{@order.freight_type}"
  pdf.text "Valor do frete: #{number_to_currency(@order.freight_price, unit: 'R$', separator: ",", delimiter: "")}"

  pdf.move_down 20

  pdf.text "Valor total dos produtos: #{number_to_currency(@order.total(@order.id), unit: 'R$', separator: ",", delimiter: "")}", size: 15, style: :bold

  pdf.move_down 20

  pdf.text "Dados adicionais", size: 15, style: :bold
  pdf.text "ICMS retido anteriormente por Substituição Tributária, conforme Art. 127 a 129, Seção XXXII, Anexo X do RICMS/PR. Total aproximado de tributos federais, estaduais e municipais: 35.85%."

end
