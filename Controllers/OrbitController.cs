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
    // Genera la URL base del sitio (por ej: https://localhost:5001 o https://tusitio.com)x
    string baseUrl = $"{Request.Scheme}://{Request.Host}";

    // Crea el link completo y lo pasa a la vista
    ViewBag.LinkCompleto = orbit.ObtenerLinkCompleto(baseUrl);

    // También pasamos los datos del orbit
    ViewBag.nombre = orbit.name;
    ViewBag.usuarios = orbit.usuarios;

    return View(orbit); // Enviamos el Orbit como modelo
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


    [HttpGet]
public async Task<IActionResult> Unirse(string link)
{
    int? idUsuario = HttpContext.Session.GetInt32("IdUsuario");
    if (idUsuario == null)
        return RedirectToAction("Login", "Account");

    // Buscar el orbit con ese link
    Orbit orbit = await miBd.BuscarOrbitPorLink(link);
    if (orbit == null)
    {
        ViewBag.MensajeError = "El enlace no es válido o el Orbit no existe.";
        return View("Error");
    }

    // Comprobar si el usuario ya está en el orbit
    bool yaUnido = await miBd.UsuarioEnOrbit(idUsuario.Value, orbit.id);
    if (yaUnido)
    {
        ViewBag.Mensaje = "Ya sos parte de este Orbit.";
        return RedirectToAction("OrbitInside", new { link = link });
    }

    // Agregar el usuario al orbit
    bool agregado = await miBd.AgregarUsuarioAOrbit(idUsuario.Value, orbit.id);

    if (agregado)
    {
        ViewBag.Mensaje = "Te uniste correctamente al Orbit.";
        return RedirectToAction("OrbitInside", new { link = link });
    }
    else
    {
        ViewBag.MensajeError = "Hubo un problema al unirte al Orbit.";
        return View("Error");
    }
}


      
    
}
