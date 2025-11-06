using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using info360.Models;

namespace info360.Controllers;

public class HomeController : Controller
{
    // private readonly ILogger<HomeController> _logger;

    // public HomeController(ILogger<HomeController> logger)
    // {
    //     _logger = logger;
    // }

    private readonly BD _bd;

    public HomeController(BD bd)
    {
        _bd = bd;
    }

    public IActionResult Index(string msg)
    {
        ViewBag.mensaje = msg;
        return View();
    }

     public IActionResult SOS()
    {
        return View();
    }

     public IActionResult Destinos()
    {
        // var destinosJson = HttpContext.Session.GetString("Destinos");
        // var destinos = string.IsNullOrEmpty(destinosJson);
        // new List<Destino>();
        // JsonConvert.DeserializeObject<List<Destino>>(destinosJson);

        return View();
    }

    
    public IActionResult GuardarContacto(string nombre, string numero)
    {
        // crear view que accedes desde el perfil y es un form de contacto de emergencia
        HttpContext.Session.SetString("nombreContacto", nombre);
        HttpContext.Session.SetString("numContacto", numero);
        return RedirectToAction("SOS");
    }

    public IActionResult Home()
    {
        return View();
    }
}
