namespace info360.Models;

public class Orbit
{
    public int id {get; private set;}
    public string name{get; private set;}
    public string foto{get; private set;}
    public string link { get; private set; }
    public List<Usuario> usuarios {get; private set;}

    public Orbit(){}
    public Orbit(string name, string foto)
    {
        this.name = name;
        this.foto = foto;
        this.link = Guid.NewGuid().ToString("N");
        this.usuarios = new List<Usuario>();
    }


     public string ObtenerCodigoLink()
        {
            return link;
        }

   public string ObtenerLinkCompleto()
        {
    return $"/Orbit/Unirse?link={link}";
        }

}