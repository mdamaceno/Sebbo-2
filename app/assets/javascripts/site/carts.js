var sum = 0;
$(".total-price").each(function() {

  var value = $(this).text();
  var value = value.replace('R$', '').replace(',', '.');
  // add only if the value is number
  if (!isNaN(value) && value.length != 0) {
    sum += parseFloat(value);
  }
});

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
  var delivery_field1 = "<%= current_user.addresses[0].field1 %>";
  var delivery_field2 = "<%= current_user.addresses[0].field2 %>";
  var delivery_field3 = "<%= current_user.addresses[0].field3 %>";
  var delivery_field4 = "<%= current_user.addresses[0].field4 %>";
  var delivery_city = "<%= current_user.addresses[0].city   %>";
  var delivery_state = "<%= current_user.addresses[0].state  %>";
  var userId = "<%= current_user.id %>";

  $.ajax({
      url: '/pedido',
      type: 'POST',
      dataType: 'json',
      data: {
        order: {
          freight_price: 0,
          freight_type: 0,
          payment_method: 0,
          status: 1,
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
      console.log("success");
      console.log(data);

      var name = [],
        quantity = [],
        price = [];

      $('.nr').each(function(index, el) {
        name.push($(this).text());
      });
      $('.p-qty').each(function(index, el) {
        quantity.push($(this).find('p_quantity').text());
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
                price: price[i],
                quantity: quantity[i],
                order_id: 1
              }
            },
          })
          .done(function(data) {
            console.log(data);
          })
          .fail(function() {
            console.log("error");
          });
      };

    })
    .fail(function() {
      console.log("error");
    });

});
