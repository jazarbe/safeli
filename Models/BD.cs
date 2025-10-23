using System.Data;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Dapper;

namespace info360.Models;

public class BD{
    private static string _connectionString = @"Server=localhost;DataBase=TPnoNum;Integrated Security=True;TrustServerCertificate=True;";
    
    public BD(){}

    public List<Orbit> ConseguirOrbitsDeUsuario(int idBuscado){
        List<Orbit> orbits = new List<Orbit>();
        using(SqlConnection connection = new SqlConnection(_connectionString)){
            string query = "SELECT * FROM Orbits WHERE idUsuario = @pIdBuscado";
            orbits = connection.Query<Orbit>(query, new {pIdBuscado = idBuscado}).ToList();
        }
        return orbits;
    }
    // ver si nos sirve buscar por id
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
    public void CambiarContraseña(string username, string nuevaContraseña)
    {
        using(SqlConnection connection = new SqlConnection(_connectionString))
        {
            string query = "UPDATE Usuarios SET contraseña = @pNuevacontraseña WHERE username = @pUsername";
            connection.Execute(query, new { pNuevacontraseña = nuevaContraseña, pUsername = username });
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
    // public void AgregarUsuario(string nombre, string apellido, string password, string username, string foto)
    // {
    //     using(SqlConnection connection = new SqlConnection(_connectionString))
    //     {
    //         string query = @"
    //             INSERT INTO Usuarios 
    //             (nombre, apellido, password, username, foto)
    //             VALUES 
    //             (@pNombre, @pApellido, @pPassword, @pUsername, @pFoto)";
            
    //             connection.Execute(query, new 
    //         {pNombre = nombre, pApellido = apellido, pPassword = password, pUsername = username, pFoto = foto});
    //     }
    // }

    // public void AgregarTarea(string titulo, string descripcion, DateTime fecha, bool finalizada, int idUsuario)
    // {
    //     using(SqlConnection connection = new SqlConnection(_connectionString))
    //     {
    //         string query = @"
    //             INSERT INTO Tareas 
    //             (titulo, descripcion, fecha, finalizada, idUsuario)
    //             VALUES 
    //             (@ptitulo, @pdescripcion, @pfecha, @pfinalizada, @pidUsuario)";
                            
    //         connection.Execute(query, new 
    //         {ptitulo = titulo, pdescripcion = descripcion, pfecha = fecha, pfinalizada = finalizada, pidUsuario = idUsuario});
    //     }
    // }
    
}