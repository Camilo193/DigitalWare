using Framework.Domain.Entity;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Framework.Domain.Interface
{
    public interface IFacturasDomain {
        bool Insertar(Facturas Factura);
        bool Actualizar(Facturas Factura);
        bool Eliminar(int Codigo);
        IEnumerable<Facturas>ObtenerTodos();
        IEnumerable<Facturas>ObtenerPorCodigo(int Codigo);
    }
}