namespace info360.Models;


public class Usuario
{
    public int id {get; private set;}
    public string nombre {get; private set;}
    public string apellido {get; private set;}
    public string email {get; private set;}
<<<<<<< HEAD
    public int nroTelefono {get; private set;}
=======
    public int numTelefono {get; private set;}
>>>>>>> af388788b2125f3d133b8da3335450a4aaef832c
    public string username {get; private set;}
    public string foto {get; private set;}
    public string bio {get; private set;}
    public DateOnly fechaNacimiento {get; private set;}
    public string contraseña {get; private set;}
    public List<Orbit> orbits {get; private set;}
    public Point ubicacion {get; private set;}
    public List<Carpeta> carpetas {get; private set;}
    
    public Usuario(){}
    public Usuario( string nombre, string apellido, string email, int nroTelefono, string username, string foto, string bio, DateOnly fechaNac, string contraseña, List<Orbit> orbits, Point ubicacion, List<Carpeta> carpetas)
    {
    
        this.nombre = nombre;
        this.apellido = apellido;
<<<<<<< HEAD
        this.email = email;
        this.nroTelefono = nroTelefono;
=======
        this.email = mail;
        this.numTelefono = numTelefono;
>>>>>>> af388788b2125f3d133b8da3335450a4aaef832c
        this.username = username;
        this.foto = foto;
        this.bio = bio;
        this.fechaNacimiento = fechaNac;
        this.contraseña = contraseña;
        this.orbits = orbits;
        this.ubicacion = ubicacion;
        this.carpetas = carpetas;
    }

}