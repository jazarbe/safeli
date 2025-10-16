namespace info360.Models;

public class Orbit{
    public int id { get ; private set;}
    public string nombre { get; private set;}
    public string foto { get; private set;}
    
    public Orbit(string nombre, string foto){
        this.nombre = nombre;
        this.foto = foto;
    }
}
