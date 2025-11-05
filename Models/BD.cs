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
public BD(){
    
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


        //Unisre por link, NO TOCAR 
//    public async Task<int> CrearOrbitAsync(Orbit orbit, int idCreador)
//         {
//             using (var conexion = new NpgsqlConnection(connectionString))
//             {
//                 string query = @"
//                     INSERT INTO orbit (name, foto, link_invitacion)
//                     VALUES (@Name, @Foto, @Link)
//                     RETURNING id;";

//                 int idOrbit = await conexion.ExecuteScalarAsync<int>(query, new
//                 {
//                     Name = orbit.name,
//                     Foto = orbit.foto,
//                     Link = orbit.linkInvitacion
//                 });

//                 // agrega al creador como miembro del grupo
//                 string insertRelacion = "INSERT INTO usuario_orbit (id_usuario, id_orbit) VALUES (@Usuario, @Orbit)";
//                 await conexion.ExecuteAsync(insertRelacion, new { Usuario = idCreador, Orbit = idOrbit });

//                 return idOrbit;
//             }
//         }

//         public async Task<bool> UnirseAOrbitPorLinkAsync(int idUsuario, string linkInvitacion)
//         {
//             using (var conexion = new NpgsqlConnection(connectionString))
//             {
//                 string queryOrbit = "SELECT id FROM orbit WHERE link_invitacion = @Link";
//                 int? idOrbit = await conexion.QueryFirstOrDefaultAsync<int?>(queryOrbit, new { Link = linkInvitacion });

//                 if (idOrbit == null)
//                     return false;

//                 string insertQuery = @"
//                     INSERT INTO usuario_orbit (id_usuario, id_orbit)
//                     SELECT @Usuario, @Orbit
//                     WHERE NOT EXISTS (
//                         SELECT 1 FROM usuario_orbit WHERE id_usuario = @Usuario AND id_orbit = @Orbit
//                     );
//                 ";

//                 int filas = await conexion.ExecuteAsync(insertQuery, new { Usuario = idUsuario, Orbit = idOrbit });
//                 return filas > 0;
//             }
//         }

//         public async Task<Orbit?> ObtenerOrbitPorLinkAsync(string link)
//         {
//             using (var conexion = new NpgsqlConnection(connectionString))
//             {
//                 string query = "SELECT * FROM orbit WHERE link_invitacion = @Link";
//                 return await conexion.QueryFirstOrDefaultAsync<Orbit>(query, new { Link = link });
//             }
//         }
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