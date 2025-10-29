namespace info360.Models;

public class Carpeta
{
    public int ID {get ; private set;}
    public string nombre {get; private set;}
    public List<Destino> Destinos {get; private set;}
    public Carpeta(){}
    public Carpeta(int ID, string nombre, List<Destino> Destinos)
    {
        this.ID = ID;
        this.nombre = nombre;
        this.Destinos = Destinos;
    }

}