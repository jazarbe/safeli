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

   private readonly BD miBd;

    public HomeController(BD bd)
    {
        miBd = bd;
    }

    public IActionResult Index(string msg)
    {
        ViewBag.mensaje = msg;
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
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        ViewBag.id = id.Value;
        return View();
    }
     public async Task<IActionResult> SafeliScore()
    {
        return View();
    }
     public async Task<IActionResult> SOS()
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        Usuario user = await miBd.BuscarUsuarioPorId(id.Value);
        ViewBag.contactoEmergencia = user.contactoEmeregencia;
        return View();
    }
}
