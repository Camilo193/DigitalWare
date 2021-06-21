//Repository Clientes
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Dapper;
using Framework.Domain.Entity;
using Framework.InfraStructure.Interface;
using Framework.Transversal.Common;

namespace Framework.InfraStructure.Repository
{
    public class ClientesRepository : IClientesRepository
    {
        private readonly IConnectionFactory _connectionFactory;

        public ClientesRepository(IConnectionFactory connectionFactory) => _connectionFactory = connectionFactory;


        public bool Eliminar(string Identificacion)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspEliminarClientes";

                var parameters = new DynamicParameters();
                parameters.Add("Identificacion", Identificacion);

                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result < 0;
            }
        }
        
        public IEnumerable<Clientes> ObtenerTodos()
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspObtenerClientes";

                var result = connection.Query<Clientes>(query, commandType: CommandType.StoredProcedure);
                return result;
            };
        }

        public IEnumerable<Clientes> ObtenerPorIdentificacion(string Identificacion)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspObtenerClientesPorIdentificacion";
                
                var parameters = new DynamicParameters();
                
                parameters.Add("Identificacion", Identificacion);

                var result = connection.Query<Clientes>(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result;
            };
        }
        
                
        public bool Actualizar(Clientes Cliente)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspActualizarClientes";

                var parameters = new DynamicParameters();
                
                parameters.Add("Identificacion", Cliente.Identificacion);
                parameters.Add("PrimerNombre", Cliente.PrimerNombre);
                parameters.Add("SegundoNombre", Cliente.SegundoNombre);
                parameters.Add("PrimerApellido", Cliente.PrimerApellido);
                parameters.Add("SegundoApellido", Cliente.SegundoApellido);
                parameters.Add("FechaNacimiento", Cliente.FechaNacimiento);
                
                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result < 0;
            }
        } 
        
        public bool Insertar(Clientes Cliente)
        {
            using (var connection = _connectionFactory.GetConnection)
            {
                var query = "UspInsertarClientes";

                var parameters = new DynamicParameters();
                
                parameters.Add("Identificacion", Cliente.Identificacion);
                parameters.Add("PrimerNombre", Cliente.PrimerNombre);
                parameters.Add("SegundoNombre", Cliente.SegundoNombre);
                parameters.Add("PrimerApellido", Cliente.PrimerApellido);
                parameters.Add("SegundoApellido", Cliente.SegundoApellido);
                parameters.Add("FechaNacimiento", Cliente.FechaNacimiento);
                
                var result = connection.Execute(query, param: parameters, commandType: CommandType.StoredProcedure);
                return result < 0;
            }
        } 
            
    }
}