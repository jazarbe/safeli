namespace info360.Models;

public class EmailCodes
{
 
    public int id { get; private set; } 
    public int userId { get; set; } 
    public string token { get; set; } 
    public DateTime creadoCuando { get; private set; }
    public DateTime expiraCuando { get; set; } 
    public bool usado { get; set; } 
    
    public EmailCodes(){}
    
    public EmailCodes(int userId, string token, DateTime createdAt, DateTime expiresAt, bool usado)
    {
        this.userId = userId;
        this.token = token;
        this.creadoCuando = createdAt;
        this.expiraCuando = expiresAt;
        this.usado = false;
    }
}