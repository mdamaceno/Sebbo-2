class Site::CreditCardController < Site::ApplicationController

  # def verify
  #   @credit_card = CreditCard.new(credit_card_params)
  # end

  def verification

    credit_card = CreditCard.new(credit_card_params)
    require 'savon'

    client = Savon.client(wsdl: 'http://tadeuclasse.zz.mu/WSCartao/Server.php?wsdl', raise_errors: false)

    response = client.call(
      :validar_cartao, message: {
        tDadosCartao: {
          "NumeroCartao" => credit_card.card_number,
          "Codigo"       => credit_card.code,
          "NomeCliente"  => credit_card.client_name,
          "Validade"     => credit_card.expiration,
          "Valor"        => credit_card.value,
          "Parcelas"     => credit_card.quota,
          "NomeEmpresa"  => "Sebbo Livros LTDA",
          "CNPJEmpresa"  => "236000157000105"
        },
        :attributes! => {
          tDadosCartao: {
            "NumeroCartao" => { "xsi:type" => "xsd:string" },
            "Codigo"       => { "xsi:type" => "xsd:int"    },
            "NomeCliente"  => { "xsi:type" => "xsd:string" },
            "Validade"     => { "xsi:type" => "xsd:string" },
            "Valor"        => { "xsi:type" => "xsd:double" },
            "Parcelas"     => { "xsi:type" => "xsd:int"    },
            "NomeEmpresa"  => { "xsi:type" => "xsd:string" },
            "CNPJEmpresa"  => { "xsi:type" => "xsd:string" }
          }
        }
    })


    puts "HEADER: #{response.header}", "HASH: #{response.hash}",
      "BODY: #{response.body}", "SUCCESS: #{response.success?}",
      "FAULT: #{response.soap_fault?}", "ERROR: #{response.http_error?}"


    order = Order.where(user_id: credit_card.client_id).last
    data = response.body.to_hash

    respond_to do |format|
      if response.success?
        order.status = "Confirmado"
        order.save

        format.html { render nothing: true, notice: 'Pedido realizado com sucesso.' }

      else
        order.status = "Em análise"
        order.save

        format.html { render nothing: true, notice: 'Verifique situação do cartão junto a operadora.' }
      end
    end
  end

  private

  def credit_card_params
    params.require(:credit_card).permit(
      :card_number, :code, :client_name, :expiration, :quota, :value, :client_id
    )
  end
end
