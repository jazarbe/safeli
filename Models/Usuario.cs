namespace info360.Models;


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
    public Usuario( string nombre, string apellido, string mail, int numTelefono, string username, string foto, string bio, DateOnly fechaNac, string contraseña, Point ubicacion)
    {
    
        this.nombre = nombre;
        this.apellido = apellido;
        this.mail = mail;
        this.numTelefono = numTelefono;
        this.username = username;
        this.foto = foto;
        this.bio = bio;
        this.fechaNac = fechaNac;
        this.contraseña = contraseña;
        this.ubicacion = ubicacion;
    }

}