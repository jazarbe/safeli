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
    public async Task<IActionResult> CrearCuenta(string nombre, string apellido, string email, int telefono, string username, string password, string pass2, DateOnly fecha, IFormFile foto, string bio)
    {
        if (miBd.ExisteCuenta(username, email, telefono) == null) //ver si funciona
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
            await miBd.AgregarUsuario(nombre, apellido, email, telefono, username, password, fecha, nombreArchivo, bio);
            ViewBag.mensaje = "Cuenta creada correctamente.";

            Usuario usuario = await miBd.BuscarUsuarioPorUsername(username) as Usuario;
            HttpContext.Session.SetInt32("IdUsuario", usuario.id);
            // loader
        }
        return RedirectToAction("Home", "Home");
    }

    public IActionResult SignUp( )
    {
        return View();
        
    }
    public IActionResult Notificaciones( )
    {
        return View(); 
    }
    public IActionResult ForgotPassword( )
    {
        return View(); 
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
        return View(); 
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