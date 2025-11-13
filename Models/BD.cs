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
    public async Task AgregarUsuario(string nombre, string apellido, string email, int nroTelefono, string username, string contraseña, DateOnly fechaNacimiento, string foto, string bio)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            if(foto == null) foto = "/images/default.jpg";
            if(bio == null) bio = "";
            
            string query = @"
            INSERT INTO ""Usuarios"" 
            (nombre, apellido, email, ""nroTelefono"", username, ""contraseña"", foto, bio, ""fechaNacimiento"")
            VALUES 
            (@pNombre, @pApellido, @pEmail, @pNroTelefono, @pUsername, @pContraseña, @pFoto, @pBio, @pFechaNacimiento);
            ";

            await connection.ExecuteAsync(query, new {pNombre = nombre, pApellido = apellido, pEmail = email, pNroTelefono = nroTelefono, pUsername = username,
            pContraseña = contraseña, pFoto = foto, pBio = bio, pFechaNacimiento = fechaNacimiento.ToDateTime(TimeOnly.MinValue)});
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

    public async Task AgregarOrbit(string name, string foto, int idUsuario)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string link = Guid.NewGuid().ToString("N");
            if(foto == null) foto = "/images/default.jpg";

            string query = "INSERT INTO \"Orbits\" (name, foto, link, idUsuario) VALUES (@pname, @pfoto, @plink, @pidUsuario)";
            await connection.ExecuteAsync(query, new 
            {ptitulo = name, pfoto = foto, plink = link, pidUsuario = idUsuario});
        }
    }
}