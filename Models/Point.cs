namespace safeli.Models;
using Microsoft.Data.SqlClient;
using Dapper;
using Newtonsoft.Json;
    public class Point
    {
        public double x { get; private set; }
        public double y { get; private set; }

        public Point(double x, double y)
        {
            x = x;
            y = y;
        }

        public Point(){}
    }