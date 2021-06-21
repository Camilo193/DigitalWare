//IRepository Clientes

using System.Collections.Generic;
using System.Threading.Tasks;
using Framework.Domain.Entity;

namespace Framework.InfraStructure.Interface
{
    public interface IClientesRepository {

        bool Insertar(Clientes Cliente);
        bool Actualizar(Clientes Cliente);
        bool Eliminar(string Identificacion);
        IEnumerable<Clientes>ObtenerTodos();
        IEnumerable<Clientes>ObtenerPorIdentificacion(string Identificacion);

    }
}