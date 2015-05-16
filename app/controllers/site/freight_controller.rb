class Site::FreightController < Site::ApplicationController
  protect_from_forgery with: :null_session

  def calc
    correios = Correios::Frete::Calculador.new(
      cep_origem: '04094-050',
      cep_destino: params[:cep],
      peso: 0.5,
      comprimento: 16,
      largura: 11,
      altura: 23
    )
    @servicos = correios.calcular :sedex, :pac
    render json: @servicos
  end
end
