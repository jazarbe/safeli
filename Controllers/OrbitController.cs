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

    [HttpPost]
    public async Task<IActionResult> Crear(string name, IFormFile foto)
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        if (id == null) return RedirectToAction("Login", "Account");
        else{    
            string nombreArchivo = "default.jpg";
            string carpeta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");
            string rutaCompleta = Path.Combine(carpeta, nombreArchivo);
            if (foto != null && foto.Length > 0)
            {
                nombreArchivo = Path.GetFileName(foto.FileName);
                rutaCompleta = Path.Combine(carpeta, nombreArchivo);
                using (var stream = new FileStream(rutaCompleta, FileMode.Create))
                {
                    foto.CopyTo(stream);
                }
            }
            int idOrbit = await miBd.AgregarOrbit(name, nombreArchivo);
            Orbit orbit = await miBd.BuscarOrbitPorId(idOrbit);
            return RedirectToAction("Unirse", "Orbit", new { link = orbit.link });
        }
    }

    public async Task<IActionResult> MenuOrbit()
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        if (id == null) return RedirectToAction("Login", "Account");
        else
        {
            Usuario user = await miBd.BuscarUsuarioPorId(id.Value);
            if(user.orbits != null && user.orbits.Count > 0) ViewBag.orbits = user.orbits;
            else ViewBag.mensaje = "Todavía no tenés Orbits";
        }
        return View();
    }

   public IActionResult OrbitInside(Orbit orbit)
    {
        string baseUrl = $"{Request.Scheme}://{Request.Host}";
        ViewBag.LinkCompleto = orbit.ObtenerLinkCompleto(baseUrl);
        ViewBag.nombre = orbit.name;
        ViewBag.usuarios = orbit.usuarios;

        return View();
    }

    public IActionResult ViewCrear()
    {
        return View();
    }

    public bool UsuarioUnido(Orbit orbit, Usuario user)
    {
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
        if (idUsuario == null) return RedirectToAction("Login", "Account");

        else{
            Usuario usu = await miBd.BuscarUsuarioPorId(idUsuario.Value);
            Orbit orbit = await miBd.BuscarOrbitPorLink(link);
            if (orbit == null)
            {
                ViewBag.mensaje = "El enlace no es válido o el Orbit no existe.";
                return View("MenuOrbit");
            }

            bool yaUnido = await miBd.UsuarioEnOrbit(idUsuario.Value, orbit.id);
            if (yaUnido)
            {
                ViewBag.Mensaje = "Ya sos parte de este Orbit.";
                return View("OrbitInside", new { link = link });
            }

            bool agregado = await miBd.AgregarUsuarioAOrbit(idUsuario.Value, orbit.id);

            if (agregado)
            {
                ViewBag.mensaje = "Te uniste correctamente al Orbit.";
                Console.WriteLine("usu es null? " + (usu == null));
                Console.WriteLine("orbit es null? " + (orbit == null));
                Console.WriteLine("usu.orbits es null? " + (usu?.orbits == null));
                Console.WriteLine("orbit.usuarios es null? " + (orbit?.usuarios == null));

                usu.orbits.Add(orbit);
                orbit.usuarios.Add(usu);
                return View("OrbitInside", new { link = link });
            }
            else
            {
                ViewBag.Mensaje = "Hubo un problema al unirte al Orbit.";
                return View("MenuOrbit");
            }
        }
    } 
}
