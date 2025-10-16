namespace info360.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

public class Carpetas
{
    public int ID {get ; private set;}
    public List<Destino> Destinos {get; private set;}

    public Carpetas(){}
}