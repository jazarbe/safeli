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

public class Account  : Controller
{
    // private readonly ILogger<Account> _logger;

    // public Account(ILogger<Account> logger)
    // {
    //     _logger = logger;
    // }

    private readonly BD _bd;

    public Account(BD bd)
    {
        _bd = bd;
    }

    public async Task<IActionResult> LogIn(string email, string password)
    {
        IEnumerable<Usuario> usuario = await _bd.LogIn(email, password);
        if(usuario == null){
            ViewBag.mensaje = "Nombre de usuario inexistente";
            return RedirectToAction("Index");
        }
        else{
            // PREGUNTARLE A ANGY !!!!
            HttpContext.Session.SetInt32("IdUsuario", usuario.id);
            // return RedirectToAction("Home", new { idSolicitado = usuario.id });
            return RedirectToAction("Home");
        }
    }

    public IActionResult LogOut()
    {
        HttpContext.Session.Clear();
        return RedirectToAction("Index");
    }

    public IActionResult CambiarPassword(string username, string nuevaContraseña)
    {
        BD miBd = new BD();
        Usuario integrante = miBd.BuscarUsuarioPorUsername(username);
        if (integrante == null)
        {
            ViewBag.mensaje = "El usuario no existe";
            return View("OlvidePassword");
        }
        
        miBd.CambiarContraseña(username, nuevaContraseña);

        ViewBag.mensaje = "Contraseña cambiada correctamente";
        // loader y dps home
        return RedirectToAction("Index", "Home");
    }
    public IActionResult CrearCuenta(string nombre, string apellido, string email, int telefono, string password, string username, DateOnly fecha, IFormFile foto, string bio)
    {
        BD miBd = new BD();

        if (miBd.ExisteCuenta(username, email, telefono) == "")
        {
            ViewBag.mensaje = "El nombre de usuario, el Email o el telefono se encuentra en uso.";
            return View("SignUp");
        }
        else{
            string nombreArchivo = "default.png";
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
            Usuario nuevo = new Usuario (nombre, apellido, email, telefono, username, rutaCompleta, bio, fecha, password);
            miBd.AgregarUsuario(nuevo);
            ViewBag.mensaje = "Cuenta creada correctamente.";
        }
        return RedirectToAction("Home", "Home");
    }

    public IActionResult SignUp( )
    {
        return RedirectToAction(); 
    }
    public IActionResult Index( )
    {
        return RedirectToAction(); 
    }
    public IActionResult Notificaciones( )
    {
        return RedirectToAction(); 
    }
    public IActionResult ForgotPassword( )
    {
        return RedirectToAction(); 
    }
    public IActionResult OtherProfile( )
    {
        return RedirectToAction(); 
    }
    public IActionResult Perfil( )
    {
        return RedirectToAction(); 
    }
    public IActionResult Permisos( )
    {
        return RedirectToAction(); 
    }
}