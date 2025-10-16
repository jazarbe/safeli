namespace info360.Models;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using Dapper;


public static class BD{
    private static string _connectionString = @"Server=localhost;DataBase=TPnoNum;Integrated Security=True;TrustServerCertificate=True;";
    
}