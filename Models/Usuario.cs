namespace info360.Models;
using System.Globalization;

public class Usuario
{
    public int id {get; private set;}
    public string nombre {get; private set;}
    public string apellido {get; private set;}
    public string email {get; private set;}
    public int nroTelefono {get; private set;}
    public string username {get; private set;}
    public string foto {get; private set;}
    public string bio {get; private set;}
    public DateTime fechaNacimiento {get; set;}
    public string contraseña {get; private set;}
    public List<Orbit> orbits {get; private set;}
    public string ubicacion {get; private set;}
    public List<Carpeta> carpetas {get; private set;}
    public int contactoEmergencia {get; private set;}
    public bool confirmado {get; private set;}

    public Usuario(){}
    public Usuario(string nombre, string apellido, string email, int nroTelefono, string username, string foto, string bio, string fechaNac, string contraseña, int contactoEmergencia)
    {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nroTelefono = nroTelefono;
        this.username = username;
        this.foto = foto;
        this.bio = bio;
        this.fechaNacimiento = DateTime.ParseExact(fechaNac, "d/M/yyyy", CultureInfo.InvariantCulture);
        this.contraseña = contraseña;
        this.orbits = new List<Orbit>();
        this.carpetas = new List<Carpeta>();
        this.contactoEmergencia = contactoEmergencia;
    }
    public Usuario(string nombre, string apellido, string email, int nroTelefono, string username, string foto, string bio, DateOnly fechaNac, string contraseña, int contactoEmergencia)
    {
        this.nombre = nombre;
        this.apellido = apellido;
        this.email = email;
        this.nroTelefono = nroTelefono;
        this.username = username;
        this.foto = foto;
        this.bio = bio;
        this.fechaNacimiento = fechaNac.ToDateTime(TimeOnly.MinValue);
        this.contraseña = contraseña;
        this.orbits = new List<Orbit>();
        this.carpetas = new List<Carpeta>();
        this.contactoEmergencia = contactoEmergencia;
    }
}