function getCep(cep, id) {
  var idElements = {
    pac: id.pac,
    sedex: id.sedex
  }
  var correios;
  $.ajax({
    url: '/calcula-frete',
    type: 'POST',
    dataType: 'json',
    data: {
      cep: cep
    },
    success: function(data) {
      document.getElementById(idElements.pac).innerHTML = '<input type="radio" name="tipoFrete" value="pac" data-valor="' + data.pac.valor + '" required> PAC - R$' + data.pac.valor + ' - até ' + data.pac.prazo_entrega + ' dias úteis';
      document.getElementById(idElements.sedex).innerHTML = '<input type="radio" name="tipoFrete" value="sedex" data-valor="' + data.sedex.valor + '" required> Sedex - R$' + data.sedex.valor + ' - até ' + data.sedex.prazo_entrega + ' dias úteis';
    }
  });
}
