namespace safeli.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

public class Destino{
    public int id {get; private set;}

    public Point ubicacion {get; private set;}
    public Destino(){}



}