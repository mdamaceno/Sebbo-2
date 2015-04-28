$(document).ready(function() {
  $('.datatable').dataTable({
    "paging": true,
    "ordering": true,
    "info": true,
    "language": {
      "lengthMenu": "Mostrar _MENU_ registros por página",
      "zeroRecords": "Nada encontrado",
      "info": "Mostrando página _PAGE_ de _PAGES_",
      "infoEmpty": "Nenhum registro disponível",
      "infoFiltered": "(filtered from _MAX_ total records)",
      "sSearch": "Filtro "
    },
    "columnDefs": [{
      "orderable": false,
      "targets": -1
    }, {
      "orderable": false,
      "targets": -2
    }, {
      "orderable": false,
      "targets": -3
    }]
  });
});
