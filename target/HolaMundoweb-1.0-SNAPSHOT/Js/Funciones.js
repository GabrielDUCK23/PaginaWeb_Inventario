$(document).ready(function () {
        $('#tablaDatos').DataTable({
                 dom: 'Bfrtip',
        buttons: [
            

                'excelHtml5','copy', 'csv', 'excel', 'pdf'
            
        ],
            responsive: true,
              language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar:",
        loadingRecords: "Cargando...",
        paginate: {
            first: "Primero",
            last: "Último",
            next: "Siguiente",
            previous: "Anterior"
        }
    }
     });
      });
   $(document).ready(function () {
           $('#tablaDatos2').DataTable({
                   dom: 'Bfrtip',
        buttons: [
            

                'excelHtml5','copy', 'csv', 'excel', 'pdf'
                
            
            
        ],
            responsive: true,
              language: {
        lengthMenu: "Mostrar _MENU_ registros por página",
        zeroRecords: "Ningún usuario encontrado",
        info: "Mostrando de _START_ a _END_ de un total de _TOTAL_ registros",
        infoEmpty: "Ningún usuario encontrado",
        infoFiltered: "(filtrados desde _MAX_ registros totales)",
        search: "Buscar:",
        loadingRecords: "Cargando...",
        paginate: {
            first: "Primero",
            last: "Último",
            next: "Siguiente",
            previous: "Anterior"
        }
    }
        });
        
    });
    