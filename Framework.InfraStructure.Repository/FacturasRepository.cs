//Repository Facturas
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Framework.Domain.Entity;
using Framework.InfraStructure.Interface;
using Framework.Transversal.Common;

namespace Framework.InfraStructure.Repository
{
    public class FacturasRepository : IFacturasRepository
    {
        private readonly IConnectionFactory _connectionFactory;

        public FacturasRepository(IConnectionFactory connectionFactory) => _connectionFactory = connectionFactory;


        public bool Eliminar(int Codigo)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspEliminarFacturas";

                var parameters = new DynamicParameters();
                parameters.Add("Codigo", Codigo);

                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }
        
        public IEnumerable<Facturas> ObtenerTodos()
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspObtenerFacturas";

                var result = connection.Query<Facturas>(query, commandType: CommandType.StoredProcedure);
                return result;
            };
        }

        public IEnumerable<Facturas> ObtenerPorCodigo(int Codigo)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspObtenerFacturasPorCodigo";
                
                var parameters = new DynamicParameters();
                
                parameters.Add("Codigo", Codigo);

                var result = connection.Query<Facturas>(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result;
            };
        }
        
                
        public bool Actualizar(Facturas Factura)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspActualizarFacturas";

                var parameters = new DynamicParameters();
                
                parameters.Add("Codigo", Factura.Codigo);
                parameters.Add("Fecha", Factura.Fecha);
                parameters.Add("Descripcion", Factura.Descripcion);
                parameters.Add("Cliente", Factura.Cliente);
                
                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        } 
        
        public bool Insertar(Facturas Factura)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspInsertarFacturas";

                var parameters = new DynamicParameters();
                parameters.Add("Codigo", Factura.Codigo);
                parameters.Add("Fecha", Factura.Fecha.HasValue ? Factura.Fecha : Factura.Fecha = DateTime.Now);
                parameters.Add("Descripcion", Factura.Descripcion);
                parameters.Add("Cliente", Factura.Cliente);
                
                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result > 0;
            }
        }
    }
}