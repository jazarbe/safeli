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


        //Pantalla de carga, NO TOCAR
    // // Acción para unirse a un Orbit por link
    //     public IActionResult Unirse(string link)
    //     {
    //         // 🕓 Empezamos a medir el tiempo
    //         Stopwatch sw = new Stopwatch();
    //         sw.Start();

    //         // 🔍 1. Buscar el Orbit por su link
    //         Orbit? orbit = BD.ObtenerOrbitPorLink(link);

    //         // 🧑 2. Obtener el usuario actual (por ejemplo, de la sesión)
    //         Usuario? usuarioActual = BD.ObtenerUsuarioPorId(HttpContext.Session.GetInt32("IdUsuario") ?? 0);

    //         bool unido = false;

    //         // ⚙️ 3. Si existe el Orbit y el Usuario
    //         if (orbit != null && usuarioActual != null)
    //         {
    //             // 4. Unir al usuario si aún no está en el orbit
    //             unido = BD.AgregarUsuarioAOrbit(usuarioActual.id, orbit.id);
    //         }

    //         // 🕒 Paramos el cronómetro
    //         sw.Stop();

    //         // 📏 Calculamos el tiempo total: tiempo de BD + 2 segundos más
    //         double tiempoTotal = sw.ElapsedMilliseconds + 2000;

    //         // Pasamos datos a la vista
    //         ViewBag.TiempoTotal = tiempoTotal;
    //         ViewBag.Unido = unido;

    //         // Mostramos la vista de carga
    //         return View("PantallaCarga");
    //     }
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
