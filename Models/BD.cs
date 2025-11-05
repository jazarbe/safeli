using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;


namespace info360.Models;

public class BD{
    private readonly string _connectionString;

    public BD(string connectionString)
    {
        _connectionString = connectionString;
    }


    public List<Orbit> ConseguirOrbitsDeUsuario(int idBuscado){
        List<Orbit> orbits = new List<Orbit>();
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE idUsuario = @pIdBuscado";
            orbits = connection.Query<Orbit>(query, new {pIdBuscado = idBuscado}).ToList();
        }
        return orbits;
    }
    
    //Comienzo de Account
 
    public Usuario LogIn(string email, string password){
        Usuario usuarioBuscado = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuarios WHERE email = @pEmail  AND password = @pPassword";
            if(query != null){
                usuarioBuscado = connection.QueryFirstOrDefault<Usuario>(query, new {pEmail = email, pPassword = password});
            }
            return usuarioBuscado;
        }
    }
    public string ExisteCuenta(string username, string email, int telefono){
        string usuarioBuscado = "";
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT id FROM Usuarios WHERE email = @pEmail OR username = @pUsername OR numTelefono = pTelefono";
            usuarioBuscado = connection.QueryFirstOrDefault<string>(query, new {pEmail = email, pUsername = username, pTelefono = telefono });
        }
        return usuarioBuscado;
    }
    public void AgregarUsuario(Usuario Unuevo)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            string query = @"
                IF foto IS NULL THEN foto = '/images/default.jpg' END
                IF bio IS NULL THEN bio = '' END
                INSERT INTO Usuarios 
                (nombre, apellido, email, nroTelefono, username, contraseña, foto, bio, fechaNacimiento)
                VALUES 
                (@pNombre, @pApellido, @pEmail, @pNroTelefono, @pUsername, @pContraseña, @pFoto, @pBio, @pFechaNacimiento)";
            
                connection.Execute(query, new 
            {pNombre = Unuevo.nombre, pApellido = Unuevo.apellido, pEmail = Unuevo.email, pNroTelefono = Unuevo.nroTelefono, pUsername = Unuevo.username, pContraseña = Unuevo.contraseña, pFoto = Unuevo.foto, pbio = Unuevo.bio, pFechaNacimiento = Unuevo.fechaNacimiento});
        }
    }



    // ver si nos sirve -- por mail sino
    public Usuario BuscarUsuarioPorId(int idBuscado){
        Usuario usuarioBuscado = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuarios WHERE id = @pIdBuscado";
            usuarioBuscado = connection.QueryFirstOrDefault<Usuario>(query, new {pIdBuscado = idBuscado});
        }
        return usuarioBuscado;
    }
    public Usuario BuscarUsuarioPorUsername(string userBuscado){
        Usuario usuarioBuscado = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Usuarios WHERE username = @puserBuscado";
            usuarioBuscado = connection.QueryFirstOrDefault<Usuario>(query, new {puserBuscado = userBuscado});
        }
        return usuarioBuscado;
    }
    public void CambiarContraseña(string username, string nuevaContraseña)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            string query = "UPDATE Usuarios SET contraseña = @pNuevacontraseña WHERE username = @pUsername";
            connection.Execute(query, new { pNuevacontraseña = nuevaContraseña, pUsername = username });
        }
    }


    // Comienzo de Orbit
    // ver si nos sirve -- capaz que por link es mejor
    public Orbit BuscarOrbitPorId(int idBuscado){
        Orbit orbitBuscado = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE id = @pIdBuscado";
            orbitBuscado = connection.QueryFirstOrDefault<Orbit>(query, new {pIdBuscado = idBuscado});
        }
        return orbitBuscado;
    }
    public Orbit BuscarOrbitPorNombre(string nombreBuscado){
        Orbit orbitBuscado = null;
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE nombre = @pNombreBuscado";
            orbitBuscado = connection.QueryFirstOrDefault<Orbit>(query, new {pNombreBuscado = nombreBuscado});
        }
        return orbitBuscado;
    }
    public void AgregarOrbit(string name, string foto, int idUsuario)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            // ponerle lo de foto default.jpg
            string link = Guid.NewGuid().ToString("N");
            
            string query = @"
                INSERT INTO Orbits 
                (name, foto, link, idUsuario)
                VALUES 
                (@pname, @pfoto, @plink, @pidUsuario)";
                            
            connection.Execute(query, new 
            {ptitulo = name, pfoto = foto, plink = link, pidUsuario = idUsuario});
        }
    }    

    // public void UpdateTarea(int idBuscado, string titulo, string descripcion, DateTime fecha, bool finalizada){
    //     using(SqlConnection connection = new SqlConnection(_connectionString)){
    //         string query = "UPDATE Tareas SET titulo = @ptitulo, descripcion = @pdescripcion, fecha = @pfecha WHERE id = @pIdBuscado";
    //         connection.QueryFirstOrDefault<Tarea>(query, new { pIdBuscado = idBuscado, ptitulo = titulo, pdescripcion = descripcion, pfecha = fecha });
    //     }
    // }
    // public void CambiarEstado(int idBuscado)
    // {
    //     using(SqlConnection connection = new SqlConnection(_connectionString))
    //     {
    //         string query = "UPDATE Tareas SET finalizada = CASE WHEN finalizada = 1 THEN 0 ELSE 1 END WHERE id = @pIdBuscado";
    //         connection.Execute(query, new { pIdBuscado = idBuscado });
    //     }
    // }
    // public void DeleteTarea(Tarea tareaBuscada){
    //     int idBuscado = tareaBuscada.id;
    //     using(SqlConnection connection = new SqlConnection(_connectionString)){
    //         string query = "DELETE FROM Tareas WHERE id = @pIdBuscado";
    //         tareaBuscada = connection.QueryFirstOrDefault<Tarea>(query, new {pIdBuscado = idBuscado});
    //     }
    // }


}