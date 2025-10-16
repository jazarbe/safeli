namespace info360.Controllers;

public class OrbitController : Controller
{
    private readonly ILogger<OrbitController> _logger;

    public OrbitController(ILogger<OrbitController> logger)
    {
        _logger = logger;
    }

}
