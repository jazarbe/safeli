namespace info360.Models;

public class Orbit
{
    public int id {get; private set;}
    public string name{get; private set;}
    public string foto{get; private set;}
    public List<Usuario> usuarios {get; private set;}

    public Orbit(){}
    public Orbit(string name, string foto, List<Usuario> usuarios)
{
    this.name = name;
    this.foto = foto;
    this.usuarios = usuarios;
}

}