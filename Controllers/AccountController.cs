using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using info360.Models;
using System.Data;
using Dapper;
using Microsoft.Data.SqlClient;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace info360.Controllers;

public class AccountController : Controller
{
    // private readonly ILogger<Account> _logger;

    // public Account(ILogger<Account> logger)
    // {
    //     _logger = logger;
    // }

    private readonly BD miBd;

    public AccountController (BD bd)
    {
        miBd = bd;
    }

    [HttpPost]
    public async Task<IActionResult> LogIn(string email, string password)
    {
        Usuario usuario = await miBd.LogIn(email, password); //ns si está bien
        string msg = "";
        if(usuario == null){
            msg = "Nombre de usuario o contraseña incorrectos";
            return RedirectToAction("Index", "Home", new { msg = msg });
        }
        else{
            HttpContext.Session.SetInt32("IdUsuario", usuario.id);
            return RedirectToAction("Home", "Home");
        }
    }

    public IActionResult Login()
    {
        return View();
    }

     public IActionResult Ayuda()
    {
        return View();
    }

     public IActionResult Tutorial()
    {
        return View();
    }

    public IActionResult LogOut()
    {
        HttpContext.Session.Clear();
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
    public async Task<IActionResult> CambiarPassword(string username, string nuevaContraseña, string pass2)
    {
        if (miBd.BuscarUsuarioPorUsername(username) == null)
        {
            ViewBag.mensaje = "El usuario no existe";
            return View("ForgotPassword");
        }
        else if(nuevaContraseña != pass2)
        {
            ViewBag.mensaje = "Las contraseñas no concuerdan";
            return View("ForgotPassword");
        }

        await miBd.CambiarContraseña(username, nuevaContraseña);

        // loader y dps home
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
    public async Task<IActionResult> CrearCuenta(string nombre, string apellido, string email, int telefono, string username, string password, string pass2, DateOnly fecha, IFormFile foto, string bio, int contactoEmergencia)
    {
        if (miBd.ExisteCuenta(username, email, telefono) == null) 
        {
            ViewBag.mensaje = "El nombre de usuario, el Email o el telefono se encuentra en uso.";
            return View("SignUp");
        }
        else if(password != pass2){
            ViewBag.mensaje = "La contraseña no coincide";
            return View("SignUp");
        }
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
            int nuevoIdUsuario = await miBd.AgregarUsuario(nombre, apellido, email, telefono, username, password, fecha, nombreArchivo, bio, contactoEmergencia);
            Usuario usuario = await miBd.BuscarUsuarioPorUsername(username) as Usuario;
            HttpContext.Session.SetInt32("IdUsuario", usuario.id);
            ViewBag.mensaje = "Cuenta creada correctamente.";
            // loader
        }
        return RedirectToAction("Home", "Home");
    }



    // [HttpPost]
    // public async Task<IActionResult> ConfirmarEmail(string token, int idUsuario)
    // {

    //     EmailCodes tokenData = await miBd.ObtenerToken(token, idUsuario); 

    //     if (tokenData == null || tokenData.usado || tokenData.expiraCuando < DateTime.Now)
    //     {
    //         return View("Index", "Home");
    //     }

    //     // 2. Ejecutar la activación
    //     try
    //     {
    //         await miBd.MarcarTokenComoUsado(tokenData.id); 
    //         await miBd.ActivarUsuario(idUsuario); 

    //         // Opcional: Iniciar sesión automáticamente o redirigir al login
    //         return RedirectToAction("Home", "Home");
    //     }
    //     catch (Exception ex)
    //     {   
    //         return RedirectToAction("Index", "Home");
    //     }
    // }
    public async Task<string> tokenGen(int nuevoIdUsuario )
    {
        string token = Guid.NewGuid().ToString("N");
            DateTime ahora = DateTime.Now;
            DateTime expira = ahora.AddMinutes(20);
            EmailCodes nuevoToken = new EmailCodes(nuevoIdUsuario, token, ahora, expira, false);
            await miBd.GuardarToken(nuevoToken);
            string urlBase = $"{this.Request.Scheme}://{this.Request.Host}";
            string urlConfirmacion = $"{urlBase}/Account/ConfirmarEmail?token={token}&idUsuario={nuevoIdUsuario}";

        return "";
        
    }


    public IActionResult SignUp( )
    {
        return View();
        
    }
    public IActionResult ForgotPassword( )
    {
        return View(); 
    }
    public async Task<IActionResult> ActualizarUbicacion(string ubicacion){
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        await miBd.UpdateUbicacion(ubicacion, id.Value);
        return RedirectToAction("Perfil");
    }
    public async Task<IActionResult> Perfil()
    {
        int? id = HttpContext.Session.GetInt32("IdUsuario");
        Usuario user = await miBd.BuscarUsuarioPorId(id.Value);

        ViewBag.Username = user.username;
        ViewBag.Email = user.email;
        ViewBag.Telefono = user.nroTelefono;
        ViewBag.Biografia = user.bio;
        ViewBag.Foto = "/images/" + user.foto;
        ViewBag.Ubicacion = user.ubicacion;
        return View(); 
    }
   
    [HttpPost]
    public IActionResult EditarPerfil(string Username, string Email, string Telefono, string Biografia, string ContactoEmergencia, IFormFile FotoPerfil)
    {
        // ACTUALIZAR INFORMACIÓN EN LA BD

        // 1. Si subió foto nueva → guardarla
        if (FotoPerfil != null && FotoPerfil.Length > 0)
        {
            var fileName = Path.GetFileName(FotoPerfil.FileName);
            var filePath = Path.Combine("wwwroot/img/perfiles", fileName);

            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                FotoPerfil.CopyTo(stream);
            }

            // Guardar ruta en BD
        }

        // 2. Guardar cambios en la BD (Username, Email, Telefono, Bio, Emergencia)

        return RedirectToAction("Perfil");
    }



    [HttpPost]
    public async Task<IActionResult> OtherProfile(int id)
    {
        Usuario user = await miBd.BuscarUsuarioPorId(id);
        ViewBag.Username = user.username;
        ViewBag.Biografia = user.bio;
        ViewBag.Point = user.ubicacion;
        ViewBag.Foto = "/images/" + user.foto;
        return View(); 
    }
    public IActionResult Permisos( )
    {
        return View(); 
    }
    
}