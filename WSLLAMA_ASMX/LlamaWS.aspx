<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LlamaWS.aspx.cs" Inherits="WSLLAMA_ASMX.LlamaWS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbMenaje" runat="server" Text="Hola: "></asp:Label>
    <asp:Button ID="btnHolaMundo" runat="server" Text="Hola mundo" OnClick="btnHolaMundo_Click" /> <br /><br />
   
    <input id="Button1" type="button" value="Muestra objeto" onclick="RecibirService()" /> <br/><br/>
    <input id="llamada" type="button" value="Muestra String JSON" onclick="AlumnoService()"/> <br /><br />
    <input id="Button2" type="button" value="Muestra con parametros" onclick="enviarParametros()" /><br /><br />
    <input id="Button3" type="button" value="Muestra con objeto Alumno" onclick="objetoEnviarAlumno()"  /> <br /><br />
    <input id="Button4" type="button" value="Muestra recibir un objeto Alumno" onclick="regresarObjeto()" />

    <script>

        //Envia una cadena en formato JSON
        function AlumnoService() {
            var cadena = { "nombre": "Angel", "edad": "24", "estado": "Sonora" }
            var parametro = " { 'alumno':'" + cadenaJSON + "' }";
            //Serializa el objeto JSON
            var cadenaJSON = JSON.stringify(cadena);

            $.ajax({
                type: 'POST',
                url: 'https://localhost:44324/WSAlumno.asmx/ParserString',
                data: parametro,
                contentType:'application/json; charset=utf-8',
                dataType:'json',
                success:exito,
                error: errorGenerico
            });
        }

       
        function RecibirService() {

            $.ajax({
                type: 'POST',
                url: 'https://localhost:44324/WSAlumno.asmx/enviarJson',
                data: null,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: exitoRecibido,
                error: errorGenerico
            });
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

        function exito(data) {
            var json = JSON.parse(data.d);
            if (json.respuesta != null) {
                    alert("Transacción con exito");

            }
            else {
                alert("La respues recibida del web services es incorrecta" + data.d);
            }

        }

        function exitoRecibido(data) {
            var json = JSON.parse(data.d);
            var alum = "";

            json.respuesta.forEach(element => alum += JSON.stringify(element));
            alert(alum);
        }

        function exitoObjeto(data) {
            
            var alum = data.d;
            alert(alum.nombre);
        }

        function enviarParametros() {
            var cadenaParametro = { id: 1, nombre:"Angel", edad:24, estado:"Sonora" }
            var cadenaJSONParametro = JSON.stringify(cadenaParametro);


            $.ajax({
                type: 'POST',
                url: 'https://localhost:44324/WSAlumno.asmx/parseParametros',
                data: cadenaJSONParametro,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: exito,
                error: errorGenerico
            });
        }

        function objetoEnviarAlumno() {
            var cadena = { id:2, nombre: "Angel", edad: "24", estado: "Sonora" }
            var cadenaJSON = JSON.stringify(cadena);
            var parametro = " { 'alumno':" + cadenaJSON + " }";
            $.ajax({
                type: 'POST',
                url: 'https://localhost:44324/WSAlumno.asmx/objeto',
                data: parametro,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: exito,
                error: errorGenerico
            });

        }

        function regresarObjeto() {
            var cadena = { nombre: "Angel", edad: 24, estado: "Sonora" }
            var json = JSON.stringify(cadena);

            $.ajax({
                type: 'POST',
                url: 'https://localhost:44324/WSAlumno.asmx/retornaObjetoAlumno',
                data: json,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: exitoObjeto,
                error: errorGenerico
            });
        }
    </script>
    </asp:Content>
