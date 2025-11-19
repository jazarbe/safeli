namespace info360.Models;


public class Destino{
    public int id {get; private set;}
    public string nombre {get; private set;}
    public string ubicacion {get; private set;}
    public Destino(){}
    public Destino(string nombre , string ubicacion)
    {
        this.nombre = nombre;
        this.ubicacion = ubicacion;
    }
}