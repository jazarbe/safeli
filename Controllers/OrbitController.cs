using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
namespace info360.Models;

public class OrbitController : Controller
{
    private readonly ILogger<OrbitController> _logger;
    // private BD bd = new BD]();

    public OrbitController(ILogger<OrbitController> logger)
    {
        _logger = logger;
    }
     // Acción que muestra un Orbit específico
        public IActionResult VerOrbit(int id)
        {
            // Empieza a medir el tiempo de la consulta
            var stopwatch = Stopwatch.StartNew();

            // Llamada a la base de datos
            Orbit orbit = BD.BuscarOrbitPorId(id);

            // Termina de medir el tiempo
            stopwatch.Stop();

            // Guardamos el tiempo que tardó la consulta en ViewBag
            ViewBag.TiempoConsulta = stopwatch.ElapsedMilliseconds; // milisegundos

            // Devolvemos la vista con el modelo
            return View(orbit);
        }

    //   [HttpPost]
    //     public async Task<IActionResult> Crear(string name, string foto)
    //     {
    //         int idUsuario = 1; // ⚠️ reemplazar por el usuario logueado
    //         Orbit orbit = new Orbit(name, foto);
    //         int idOrbit = await bd.CrearOrbitAsync(orbit, idUsuario);

    //         ViewBag.Link = orbit.link;
    //         return View("OrbitCreado", orbit);
    //     }

    //     [HttpGet("/orbit/unirse/{link}")]
    //     public async Task<IActionResult> Unirse(string link)
    //     {
    //         int idUsuario = 1; // ⚠️ reemplazar con el ID del usuario actual
    //         bool unido = await bd.UnirseAOrbitPorLinkAsync(idUsuario, link);

    //         if (unido)
    //             return View("UnionExitosa");
    //         else
    //             return View("UnionFallida");
    //     }

    //     [HttpGet("/orbit/{link}")]
    //     public async Task<IActionResult> Detalle(string link)
    //     {
    //         var orbit = await bd.ObtenerOrbitPorLinkAsync(link);
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
        return View();
    }
}
