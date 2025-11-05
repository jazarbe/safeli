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

    private readonly BD _bd;

    public OrbitController(BD bd)
    {
        _bd = bd;
    }


     // Acción que muestra un Orbit específico
    public async Task<IActionResult> VerOrbit(string link)
    {
        // Empieza a medir el tiempo de la consulta
        var stopwatch = Stopwatch.StartNew();

        // Llamada a la base de datos
        IEnumerable<Orbit> orbit = await _bd.BuscarOrbitPorLink(link);

        // Termina de medir el tiempo
        stopwatch.Stop();

        // Guardamos el tiempo que tardó la consulta en ViewBag
        ViewBag.TiempoConsulta = stopwatch.ElapsedMilliseconds; // milisegundos

        // Devolvemos la vista con el modelo
        return View(orbit);
    }

        public async Task<IActionResult> Crear(string name, string foto)
        {
            IEnumerable<Orbit> orbit = new IEnumerable<Orbit>(name, foto);
            // int idOrbit = await_bd.CrearOrbitAsync(orbit, HttpContext.Session.GetInt32("IdUsuario"));
            ViewBag.Link = orbit.link;

            // loader pero igual no hay una view de crear orbits donde hacer este método
            return View("MenuOrbit");
        }

    //     [HttpGet("/orbit/unirse/{link}")]
    //     public async Task<IActionResult> Unirse(string link)
    //     {
    //         bool unido = await_bd.UnirseAOrbitPorLinkAsync(HttpContext.Session.GetInt32("IdUsuario"), link);

    //         if (unido)
    //             return View("OrbitInside");
    //         else
    //             ViewBag.mensaje = "Operación fallida";
    //             return View("MenuOrbit");
    //     }

    //     [HttpGet("/orbit/{link}")]
    //     public async Task<IActionResult> Detalle(string link)
    //     {
    //         var orbit = await_bd.ObtenerOrbitPorLinkAsync(link);
    //         if (orbit == null)
    //             return NotFound();

    //         return View("DetalleOrbit", orbit);
    //     }
    // }



    public IActionResult MenuOrbit()
    {
        return View();
    }

    public IActionResult OrbitInside()
    {
        // cargar los datos del orbit específico
        return View();
    }
}
