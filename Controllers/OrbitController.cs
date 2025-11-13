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

    public IActionResult Crear(string name, string foto)
    {
        Orbit orbit = new Orbit (name, foto);
        // int idOrbit = await_bd.CrearOrbitAsync(orbit, HttpContext.Session.GetInt32("IdUsuario"));
        ViewBag.Link = orbit.link;

        // loader pero igual no hay una view de crear orbits donde hacer este método
        return View("MenuOrbit");
    }

    public async Task<IActionResult> MenuOrbit()
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        Usuario user = await miBd.BuscarUsuarioPorId(id.Value);

        ViewBag.orbits = user.orbits;
        return View();
    }

    public IActionResult OrbitInside(Orbit orbit)
    {
        ViewBag.nombre = orbit.name;
        ViewBag.link = orbit.link;
        ViewBag.usuarios = orbit.usuarios;
        return View();
    }

    public bool UsuarioUnido(Orbit orbit, Usuario user){
        bool check = false;
        
        foreach(Usuario u in orbit.usuarios){
            if (u.id == user.id) check = true;
        }

        return check;
    }

      
    // // Acción para unirse a un Orbit por link
    //     public IActionResult Unirse(string link)
    //     {
    //         // 🕓 Empezamos a medir el tiempo
    //         Stopwatch sw = new Stopwatch();
    //         sw.Start();

    //         // 🔍 1. Buscar el Orbit por su link
    //         Orbit orbit = BD.BuscarOrbitPorLink(link);

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

            
    //         return View("OrbitCarga");
    //     }
}
