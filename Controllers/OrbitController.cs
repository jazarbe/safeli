using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
namespace info360.Models;

public class OrbitController : Controller
{
    // private readonly ILogger<OrbitController> _logger;

    // public OrbitController(ILogger<OrbitController> logger)
    // {
    //     _logger = logger;
    // }

    private readonly BD miBd;

    public OrbitController(BD bd)
    {
        miBd = bd;
    }


    public async Task<IActionResult> VerOrbit(string link) // muestra un Orbit específico
    {
        // Empieza a medir el tiempo de la consulta --> para el loader
        var stopwatch = Stopwatch.StartNew();

        Orbit orbit = await miBd.BuscarOrbitPorLink(link);

        stopwatch.Stop();
        ViewBag.TiempoConsulta = stopwatch.ElapsedMilliseconds;

        return RedirectToAction("OrbitInside", "OrbitController", new {orbit = orbit});
    }

    public async Task<IActionResult> Crear(string name, string foto)
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        if (id == null) return RedirectToAction("Login", "Account");
        else await miBd.AgregarOrbit(name, foto, id.Value);

        // loader
        return View("MenuOrbit");
    }

    public async Task<IActionResult> MenuOrbit()
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        if (id == null) return RedirectToAction("Login", "Account");
        else
        {
            Usuario user = await miBd.BuscarUsuarioPorId(id.Value);
            if(user.orbits != null && user.orbits.Count > 0) ViewBag.orbits = user.orbits;
            else ViewBag.mensaje = "Todavía no tenés Orbits.";
        }
        return View();
    }

    public IActionResult OrbitInside(Orbit orbit)
    {
        ViewBag.nombre = orbit.name;
        ViewBag.link = orbit.link;
        ViewBag.usuarios = orbit.usuarios;
        return View();
    }

    public IActionResult ViewCrear()
    {
        return View();
    }

    public bool UsuarioUnido(Orbit orbit, Usuario user){
        bool check = false;
        
        foreach(Usuario u in orbit.usuarios){
            if (u.id == user.id) check = true;
        }

        return check;
    }

      
    
}
