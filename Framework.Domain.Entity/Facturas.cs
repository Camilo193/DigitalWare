//Entidad Facturas
using System;
using System.Collections.Generic;
using System.Text;
namespace Framework.Domain.Entity
{
    public class Facturas { 
        public int? Codigo { get; set; }
        public DateTime? Fecha { get; set; }
        public string Descripcion { get; set; }
        public string Cliente { get; set; }
    }
}