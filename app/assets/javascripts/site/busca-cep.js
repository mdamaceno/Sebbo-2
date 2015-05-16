$(document).ready(function() {

  function limpa_formulário_cep() {
    // Limpa valores do formulário de cep.
    $("#user_addresses_attributes_0_field1").val("");
    $("#user_addresses_attributes_0_field4").val("");
    $("#user_addresses_attributes_0_city").val("");
    $("#user_addresses_attributes_0_state").val("");
  }

  $("#user_addresses_attributes_0_postalcode").blur(function() {
    var cep = $(this).val();

    if (cep != "") {
      var validacep = /^[0-9]{5}-?[0-9]{3}$/;

      if (validacep.test(cep)) {
        $("#user_addresses_attributes_0_field1").val("...");
        $("#user_addresses_attributes_0_field4").val("...");
        $("#user_addresses_attributes_0_city").val("...");
        $("#user_addresses_attributes_0_state").val("...");

        $.getJSON("//viacep.com.br/ws/" + cep + "/json/", function(dados) {
          if (!("erro" in dados)) {
            $("#user_addresses_attributes_0_field1").val(dados.logradouro);
            $("#user_addresses_attributes_0_field4").val(dados.bairro);
            $("#user_addresses_attributes_0_city").val(dados.localidade);
            $("#user_addresses_attributes_0_state").val(dados.uf);
          } else {
            limpa_formulário_cep();
            alert("Formato de CEP inválido.");
          }
        });
      }
    } else {
      limpa_formulário_cep();
    }
  });
});
