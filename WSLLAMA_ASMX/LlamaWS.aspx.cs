using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WSLLAMA_ASMX.WSAlumnos;

namespace WSLLAMA_ASMX
{
    public partial class LlamaWS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHolaMundo_Click(object sender, EventArgs e)
        {
            WSAlumno wsalumno = new WSAlumno();           
            lbMenaje.Text = wsalumno.HelloWorld();
        }

       
    }
}