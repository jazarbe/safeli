namespace safeli.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

public class Usuario
{
    public int id {get; private set;}

    public string nombre {get; private set;}

    public string apellido {get; private set;}

    public string mail {get; private set;}

    public int numTelefono {get; private set;}

    public string username {get; private set;}
    
     public string foto {get; private set;}

     public string bio {get; private set;}

     public DateOnly fechaNac {get; private set;}
     public string contraseña {get; private set;}

    public Point ubicacion {get; private set;}

    public Usuario(){}
    
}