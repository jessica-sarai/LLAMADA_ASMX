using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.ClientServices;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

namespace WSLLAMA_ASMX.Ventana
{
    public partial class VentanaModal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string eliminarModal(int id)
        {
            string mensaje;
            try
            {
                mensaje = "EXITO";
            }
            catch (Exception)
            {
                mensaje = "Error..";
            }
            string respuesta = JsonConvert.SerializeObject(
                new
                {
                    respuesta = mensaje
                }
                );

            return respuesta;
        }
    }
}