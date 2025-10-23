using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
namespace info360.Models;

public class OrbitController : Controller
{
    private readonly ILogger<OrbitController> _logger;

    public OrbitController(ILogger<OrbitController> logger)
    {
        _logger = logger;
    }

    public IActionResult MenuOrbit()
    {
        return View();
    }

    public IActionResult OrbitInside()
    {
        return View();
    }
}
