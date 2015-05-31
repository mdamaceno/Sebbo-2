$(document).ready(function() {

  if (document.getElementById("zipcode").innerHTML != null) {

    getCep(document.getElementById("zipcode").innerHTML, {
      'pac': 'PAC',
      'sedex': 'SEDEX'
    });

    var sum = 0;
    $(".total-price").each(function() {

      var value = $(this).text();
      var value = value.replace('R$', '').replace(',', '.');
      // add only if the value is number
      if (!isNaN(value) && value.length != 0) {
        sum += parseFloat(value);
      }
    });

    var value_without_freight = sum.toFixed(2)
    document.getElementById('total-cart').innerHTML = 'Total: R$' + sum.toFixed(2).replace('.', ',');

    $(".product-refresh").click(function(event) {
      var id = $(this).closest("tr").find(".pid").text();
      var qty = $(this).closest("tr").find(".p-qty").find("#p_quantity").val();

      $.ajax({
          url: '/carrinho/' + id,
          type: 'post',
          dataType: 'json',
          data: {
            cart: {
              quantity: qty
            }
          },
        })
        .done(function() {
          location.reload();
        })
        .fail(function() {
          console.log("error");
        });
    });

    // Ao clicar em Finalizar pedido
    $('#save-order').click(function() {
      var delivery_field1 = gon.address.field1;
      var delivery_field2 = gon.address.field2;
      var delivery_field3 = gon.address.field3;
      var delivery_field4 = gon.address.field4;
      var delivery_city = gon.address.city;
      var delivery_state = gon.address.state;
      var userId = gon.current_user.id;

      $.ajax({
          url: '/pedido',
          type: 'POST',
          dataType: 'json',
          data: {
            order: {
              freight_price: parseFloat($("input[name='tipoFrete']:checked").data("valor")),
              freight_type: $("input[name='tipoFrete']:checked").val(),
              status: 'Processando',
              delivery_field1: delivery_field1,
              delivery_field2: delivery_field2,
              delivery_field3: delivery_field3,
              delivery_field4: delivery_field4,
              delivery_city: delivery_city,
              delivery_state: delivery_state,
              user_id: userId
            }
          },
        })
        .done(function(data) {
          console.log(data);

          var name = [],
            quantity = [],
            price = [];

          $('.nr').each(function(index, el) {
            name.push($(this).text());
          });
          $('.p-qty').each(function(index, el) {
            quantity.push($(this).find('#p_quantity').val());
          });
          $('.p-price').each(function(index, el) {
            price.push($(this).text());
          });

          for (var i = 0; i < name.length; i++) {
            $.ajax({
                url: '/produtos-pedidos',
                type: 'POST',
                dataType: 'json',
                data: {
                  product_order: {
                    name: name[i],
                    price: price[i].replace('R$', '').replace(',', '.'),
                    quantity: quantity[i],
                    order_id: data.id
                  }
                },
              })
              .done(function(data) {
                console.log("success");
              })
              .fail(function() {
                console.log("error");
              });
          };

          // Verificando cartão de crédito
          $.ajax({
            url: '/cartao-credito',
            type: 'POST',
            dataType: 'json',
            data: {
              credit_card: {
                card_number: $("input[name='credit_card_number']").val(),
                code: $("input[name='credit_card_code']").val(),
                client_name: $("input[name='credit_card_client_name']").val(),
                expiration: $("input[name='credit_card_year']").val() + $("input[name='credit_card_month']").val(),
                quota: $("#quota option:selected").val(),
                value: parseFloat(value_without_freight) + parseFloat($("input[name='tipoFrete']:checked").data("valor")),
                client_id: gon.current_user.id
              }
            },
          })
          .done(function() {
            window.location.reload();
          })
          .fail(function() {
            window.location.reload();
          });
          
        })
        .fail(function() {
          console.log("error");
        });


    });
  } else {
    window.location.reload("/usuarios" + gon.current_user.id + "/editar");
  }
});
