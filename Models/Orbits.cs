namespace safeli.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

public class Orbits
{
    public int id {get; private set;}
    public string name{get; private set;}
    public string foto{get; private set;}

    public Orbits(){}

}