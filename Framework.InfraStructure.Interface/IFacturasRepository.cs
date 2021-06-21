//IRepository Facturas

using System.Collections.Generic;
using System.Threading.Tasks;
using Framework.Domain.Entity;

namespace Framework.InfraStructure.Interface
{
    public interface IFacturasRepository {

        bool Insertar(Facturas Factura);
        bool Actualizar(Facturas Factura);
        bool Eliminar(int Codigo);
        IEnumerable<Facturas>ObtenerTodos();
        IEnumerable<Facturas>ObtenerPorCodigo(int Codigo);

    }
}