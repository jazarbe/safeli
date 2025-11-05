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


    // public async Task<IEnumerable<Producto>> ObtenerProductos()
    // {
    //     using (var conn = new NpgsqlConnection(_connectionString))
    //     {
    //         string sql = "SELECT p.id, p.nombre, p.precio FROM productos p";
    //         return await conn.QueryAsync<Producto>(sql);
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
 
    public async Task<IEnumerable<Usuario>> LogIn(string email, string password){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuarios WHERE email = @pEmail  AND password = @pPassword";
            return await connection.QueryAsync<Usuario>(query, new {pEmail = email, pPassword = password});
        }
    }

    // para buscar users tmb
    public async Task<IEnumerable<string>> ExisteCuenta(string username, string email, int telefono){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT id FROM Usuarios WHERE email = @pEmail OR username = @pUsername OR numTelefono = pTelefono";
            return await connection.QueryAsync<string>(query, new {pEmail = email, pUsername = username, pTelefono = telefono });
        }
        
    }
    public async Task AgregarUsuario(Usuario newUser)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = @"
                IF @pFoto IS NULL THEN foto = '/images/default.jpg' END
                IF @pBio IS NULL THEN bio = '' END
                INSERT INTO Usuarios 
                (nombre, apellido, email, nroTelefono, username, contraseña, foto, bio, fechaNacimiento)
                VALUES 
                (@pNombre, @pApellido, @pEmail, @pNroTelefono, @pUsername, @pContraseña, @pFoto, @pBio, @pFechaNacimiento)";
            
                await connection.ExecuteAsync(query, new
            {pNombre = newUser.nombre, pApellido = newUser.apellido, pEmail = newUser.email, pNroTelefono = newUser.nroTelefono, pUsername = newUser.username, pContraseña = newUser.contraseña, pFoto = newUser.foto, pbio = newUser.bio, pFechaNacimiento = newUser.fechaNacimiento});
        }
    }

    public async Task<IEnumerable<Usuario>> BuscarUsuarioPorUsername(string userBuscado){
        Usuario usuarioBuscado = null;
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuarios WHERE username = @puserBuscado";
            return await connection.QueryAsync<Usuario>(query, new {puserBuscado = userBuscado});
        }
    }
    public async Task CambiarContraseña(string username, string nuevaContraseña)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string query = "UPDATE Usuarios SET contraseña = @pNuevacontraseña WHERE username = @pUsername";
            await connection.ExecuteAsync(query, new { pNuevacontraseña = nuevaContraseña, pUsername = username });
        }
    }
    public async Task<IEnumerable<Orbit>> ConseguirOrbitsDeUsuario(int idBuscado){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE idUsuario = @pIdBuscado";
            return await connection.QueryAsync<Orbit>(query, new {pIdBuscado = idBuscado});
        }
    }


    // Comienzo de Orbit
    public async Task<IEnumerable<Orbit>> BuscarOrbitPorLink(string linkBus){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE link = @pLinkBus";
            return await connection.QueryAsync<Orbit>(query, new {pLinkBus = linkBus});
        }
    }
    public async Task<IEnumerable<Orbit>> BuscarOrbitPorNombre(string nombreBuscado){
        using(var connection = new NpgsqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE nombre = @pNombreBuscado";
            return await connection.QueryAsync<Orbit>(query, new {pNombreBuscado = nombreBuscado});
        }
    }
    public async Task AgregarOrbit(string name, string foto, int idUsuario)
    {
        using(var connection = new NpgsqlConnection(_connectionString))
        {
            string link = Guid.NewGuid().ToString("N");
            
            string query = @"
                IF @pFoto IS NULL THEN foto = '/images/default.jpg' END
                INSERT INTO Orbits 
                (name, foto, link, idUsuario)
                VALUES 
                (@pname, @pfoto, @plink, @pidUsuario)";
                            
            await connection.ExecuteAsync(query, new 
            {ptitulo = name, pfoto = foto, plink = link, pidUsuario = idUsuario});
        }
    }
}