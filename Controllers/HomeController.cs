using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using info360.Models;

namespace info360.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

     public IActionResult SOS()
    {
        return View();
    }

     public IActionResult Destinos()
    {
        ViewBag.Contacto = HttpContext.Session.GetString("Contacto");
        ViewBag.Nombre = HttpContext.Session.GetString("NombreContacto");
        return View();
    }

     [HttpPost]
    public IActionResult GuardarContacto(string nombre, string numero)
    {
        HttpContext.Session.SetString("NombreContacto", nombre);
        HttpContext.Session.SetString("Contacto", numero);
        return RedirectToAction("Destinos");
    }

    public IActionResult Home()
    {
        return View();
    }
}
