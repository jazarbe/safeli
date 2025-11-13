namespace info360.Models;

public class EmailCodes
{
 
    public int Id { get; private set; } 
    public int UserId { get; set; } 
    public string Token { get; set; } 
    public DateTime creadoCuando { get; private set; }
    public DateTime expiraCuando { get; set; } 
    public bool Usado { get; set; } 
    
    public EmailCodes(){}
    
    public EmailCodes(int userId, string token, DateTime createdAt, DateTime expiresAt, bool usado)
    {
        this.UserId = userId;
        this.Token = token;
        this.creadoCuando = createdAt;
        this.expiraCuando = expiresAt;
        this.Usado = false;
    }
}