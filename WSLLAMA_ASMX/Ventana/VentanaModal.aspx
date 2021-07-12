<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VentanaModal.aspx.cs" Inherits="WSLLAMA_ASMX.Ventana.VentanaModal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <asp:Label ID="lbID" runat="server" Text="Id: "></asp:Label>
    <asp:Label ID="lbIdMuestra" runat="server" Text="7"></asp:Label>
    <br />
    <asp:Label ID="lbNombre" runat="server" Text="Nombre:"></asp:Label>
    <asp:Label ID="lbNombreMuestra" runat="server" Text="Jose"></asp:Label>
    <br />
    <asp:Label ID="lbEstado" runat="server" Text="Estado: "></asp:Label>
    <asp:Label ID="lbEstadoMuestra" runat="server" Text="Sonora"></asp:Label>
    <br />
    <br />
   
<div class="container" >

  <!-- Botón para abrir la ventana modal -->
  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="IdEliminar" onclick="eliminar()">
    Eliminar
  </button>

  <!-- Ventana Modal -->
  <div class="modal" id="ventanaModal"  role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Encabezado Modal -->
        <div class="modal-header">
          <h4 class="modal-title">Detalle Alumno</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Curepo de la Modal -->
        <div class="modal-body" id="cuerpoModal">
            <p id="Modal">Parrafo de Prueba</p>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        <button type="button" id="btnEliminarConfirmar" name="submit" class="btn btn-success" data-dismiss="modal" onclick="eliminarConfirmar()">Confirmar</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div>
    <script>

        function eliminar() {
            var nombre = $("#<%=lbIdMuestra.ClientID %>").text() + ' ' +
                         $("#<%=lbNombreMuestra.ClientID %>").text() + ' ' +
                         $("#<%=lbEstadoMuestra.ClientID %>").text()
            $("#Modal").text("Desea eliminar al usuario: " + nombre);
            $("#ventanaModal").modal();
        }

        function eliminarConfirmar() {
            var json = $("#<%=lbIdMuestra.ClientID %>").text();
            var parametro = JSON.stringify(json);
            /*var json = eliminar();*/
            var urlws = '<%= ResolveUrl("~/Ventana/VentanaModal.aspx/eliminarModal")%>';
            $.ajax({
                type: 'POST',
                url: urlws,                
                data: json,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: exito,
                error: errorGenerico
            });
        }

        function exito(data) {
            var json = JSON.parse(data.d);
            if (json.respuesta != null) {
                    alert("Transacción con exito");
            }
            else {
                alert("La respues recibida del web services es incorrecta" + data.d);
            }

        }

        function errorGenerico(jqXHR, exeception) {
            var mensaje = '';
            if (jqXHR.status === 0) {
                mensaje = 'No está conectado';
            }
            else if (jqXHR.status === 404) {
                mensaje = 'Página no encontrada [404]';
            }
            else if (jqXHR.status === 500) {
                mensaje = 'Error no hay conexión al servidor [500]';
            }
            else if (jqXHR.status === 'parseerror') {
                mensaje = 'El parseo del JSON es erroneo';
            }
            else if (jqXHR.status === 'timeout') {
                $('body').addClass('loaded');
            }
            else if (jqXHR.status === 'abort') {
                mensaje = 'La petición Ajax fue afortada';
            }
            else {
                mensaje = 'Error no conocido';
                console.log(exeception);
            }
            alert(mensaje);
        }
            
    </script>
</asp:Content>
