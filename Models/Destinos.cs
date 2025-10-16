namespace info360.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;

public class Destino{
    public int id {get; private set;}

    public struct Point
    {
        public double x { get; private set; }
        public double y { get; private set; }

        public Point(double x, double y)
        {
            x = x;
            y = y;
        }
    }
    


}