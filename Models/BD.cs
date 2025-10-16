using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Dapper;

namespace safeli.Models;

public static class BD{
    private static string _connectionString = @"Server=localhost;DataBase=TPnoNum;Integrated Security=True;TrustServerCertificate=True;";

}