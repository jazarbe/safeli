using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using Npgsql;


namespace info360.Models;

public class BD{
    private readonly string _connectionString;

    public BD(string connectionString)
    {
        _connectionString = connectionString;
    }


    // public async Task<Producto>> ObtenerProductos()
    // {
    //     using (var conn = new NpgsqlConnection(_connectionString))
    //     {
    //         string sql = "SELECT p.id, p.nombre, p.precio FROM productos p";
    //         return await conn.QueryFirstOrDefaultAsync<Producto>(sql);
    //     }
    // }

    // public async Task InsertarProducto(Producto producto)
    // {
    //     using (var conn = new NpgsqlConnection(_connectionString))
    //     {
    //         string sql = "INSERT INTO productos (nombre, precio) VALUES (@Nombre, @Precio)";
    //         await conn.ExecuteAsync(sql, new { producto.Nombre, producto.Precio });
    //     }
    // }
    //Comienzo de Account
 
    public async Task<Usuario> LogIn(string email, string contraseña){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM \"Usuarios\" WHERE email = @pEmail  AND contraseña = @pPassword";
            return await connection.QueryFirstOrDefaultAsync<Usuario>(query, new {pEmail = email, pPassword = contraseña});
        }
    }

    // para buscar users tmb
    public async Task<string> ExisteCuenta(string username, string email, int telefono){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT id FROM \"Usuarios\" WHERE email = @pEmail OR username = @pUsername OR nroTelefono = pTelefono";
            return await connection.QueryFirstOrDefaultAsync<string>(query, new {pEmail = email, pUsername = username, pTelefono = telefono });
        }
        
    }
public async Task<int> AgregarUsuario(string nombre, string apellido, string email, int nroTelefono, string username, string contraseña, DateOnly fechaNacimiento, string foto, string bio, int contactoEmergencia)
{
    using(var connection = new NpgsqlConnection(_connectionString))
    {
        if(foto == null) foto = "/images/default.jpg";
        if(bio == null) bio = "";
        
        string query = @"
        INSERT INTO ""Usuarios"" 
        (nombre, apellido, email, ""nroTelefono"", username, ""contraseña"", foto, bio, ""fechaNacimiento"", confirmado, ""contactoEmergencia"" )
        VALUES 
        (@pNombre, @pApellido, @pEmail, @pNroTelefono, @pUsername, @pContraseña, @pFoto, @pBio, @pFechaNacimiento, @pConfirmado, @pContactoEmergencia)
        RETURNING id; 
        ";

        int nuevoId = await connection.QuerySingleAsync<int>(query, new {
            pNombre = nombre, 
            pApellido = apellido, 
            pEmail = email, 
            pNroTelefono = nroTelefono, 
            pUsername = username,
            pContraseña = contraseña, 
            pFoto = foto, 
            pBio = bio, 
            pFechaNacimiento = fechaNacimiento.ToDateTime(TimeOnly.MinValue),
            pContactoEmergencia = contactoEmergencia,
            pConfirmado = false 

        });

        return nuevoId;
    }
}
    public async Task<Usuario> BuscarUsuarioPorId(int idBuscado){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM \"Usuarios\" WHERE id = @pIdBuscado";
            return await connection.QueryFirstOrDefaultAsync<Usuario>(query, new {pIdBuscado = idBuscado});
        }
    }
        public async Task<Usuario> ObtenerUsuarioPorId(int idUsuario)
    {
        using (var conn = new NpgsqlConnection(_connectionString))
        {
            string sql = "SELECT p.id, nombre, apellido, email, nroTelefono, username, contraseña, foto, bio, fechaNacimiento";
            return await conn.QueryFirstOrDefaultAsync<Usuario>(sql);
        }
    }


    public async Task<Usuario> BuscarUsuarioPorUsername(string userBuscado){
        Usuario usuarioBuscado = null;
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM \"Usuarios\" WHERE username = @puserBuscado";
            return await connection.QueryFirstOrDefaultAsync<Usuario>(query, new {puserBuscado = userBuscado});
        }
    }
    public async Task CambiarContraseña(string username, string nuevaContraseña)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = "UPDATE \"Usuarios\" SET contraseña = @pNuevacontraseña WHERE username = @pUsername";
            await connection.ExecuteAsync(query, new { pNuevacontraseña = nuevaContraseña, pUsername = username });
        }
    }

    public async Task UpdateUbicacion (string ubicacion, int id){
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = "UPDATE \"Usuarios\" SET ubicacion = @pUbicacion WHERE id = @pId";
            await connection.ExecuteAsync(query, new { pUbicacion = ubicacion, pId = id });
        }
    }

    //INICIO VERIFICACION POR MAIL
    public async Task GuardarToken(EmailCodes token)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = @"
            INSERT INTO ""EmailCodes"" 
            (token, ""IdUsuario"", ""CreadoCuando"", ""ExpiraCuando"", usado)
            VALUES 
            (@Token, @IdUsuario, @CreadoCuando, @ExpiraCuando, @Usado);
            ";
            await connection.ExecuteAsync(query, token);
        }
    }
    public async Task<EmailCodes> ObtenerToken(string token, int idUsuario)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = @"
            SELECT 
                id, token, ""IdUsuario"", ""CreadoCuando"", ""ExpiraCuando"", usado
            FROM 
                ""EmailCodes""
            WHERE 
                token = @Token 
                AND ""IdUsuario"" = @IdUsuario
            ORDER BY ""CreadoCuando"" DESC
            LIMIT 1;
            ";

            // QueryFirstOrDefaultAsync mapea la primera fila a un objeto EmailCodes.
            // Si no se encuentra, devuelve null.
            return await connection.QueryFirstOrDefaultAsync<EmailCodes>(query, new { 
                Token = token, 
                IdUsuario = idUsuario 
            });
        }
    }

    public async Task MarcarTokenComoUsado(int id)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = @"
            UPDATE 
                ""EmailCodes""
            SET 
                usado = TRUE
            WHERE 
                id = @Id;
            ";

            // ExecuteAsync ejecuta la operación de actualización
            await connection.ExecuteAsync(query, new { 
                Id = id 
            });
        }
    }

    public async Task ActivarUsuario(int idUsuario)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = @"
            UPDATE 
                ""Usuarios""
            SET 
                confirmado = TRUE
            WHERE 
                id = @IdUsuario;
            ";

            // ExecuteAsync ejecuta la operación de actualización
            await connection.ExecuteAsync(query, new { 
                IdUsuario = idUsuario 
            });
        }
    }
    //FIN VERIFICACION POR MAIL

    //FIN ACCOUNT

    // Comienzo de Orbit
    public async Task<Orbit> BuscarOrbitPorLink(string linkBus){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM \"Orbits\" WHERE link = @pLinkBus";
            return await connection.QueryFirstOrDefaultAsync<Orbit>(query, new {pLinkBus = linkBus});
        }
    }
    public async Task<Orbit> BuscarOrbitPorId(int idBuscado){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM \"Orbits\" WHERE id = @pIdBuscado";
            return await connection.QueryFirstOrDefaultAsync<Orbit>(query, new {pIdBuscado = idBuscado});
        }
    }
    public async Task<bool> AgregarUsuarioAOrbit(int idUsuario, int idOrbit)
{
    using (var connection = new NpgsqlConnection(_connectionString))
    {
       string query = @"
            INSERT INTO ""Usuarios_Orbits"" 
            (""IdUsuario"", ""IdOrbit"")
            VALUES 
            (@pIdUsuarios, @pIDOrbit);
            ";

        int filasAfectadas = await connection.ExecuteAsync(query, new { pIdUsuario = idUsuario, pIdOrbit = idOrbit });
        return filasAfectadas > 0;
    }
}


    public async Task<bool> UsuarioEnOrbit(int idUsuario, int idOrbit)
{
    using (var connection = new NpgsqlConnection(_connectionString))
    {
        string query = @"
            SELECT COUNT(*) 
            FROM ""Usuarios_Orbits"" 
            WHERE ""IdUsuario"" = @pIdUsuario AND ""IdOrbit"" = @pIdOrbit;
        ";

        int count = await connection.ExecuteScalarAsync<int>(query, new { pIdUsuario = idUsuario, pIdOrbit = idOrbit });
        return count > 0;
    }
}

    public async Task AgregarOrbit(string name, string foto, int idUsuario)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string link = Guid.NewGuid().ToString("N");
            if(foto == null) foto = "/images/default.jpg";

            string query = "INSERT INTO \"Orbits\" (nombre, foto, link) VALUES (@pname, @pfoto, @plink)";
            await connection.ExecuteAsync(query, new {pname = name, pfoto = foto, plink = link});

            string query2 = "INSERT INTO \"OrbitUsuario\" (idOrbit, idUsuario) VALUES ((SELECT id FROM \"Orbits\" WHERE link = @plink), @pidUsuario)";
            await connection.ExecuteAsync(query2, new {plink = link, pidUsuario = idUsuario});
        }
    }
}