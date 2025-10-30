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
    private readonly ILogger<Account> _logger;

    public Account(ILogger<Account> logger)
    {
        _logger = logger;
    }

    public IActionResult LogIn(string username, string email, string passwordIntentada)
    {
        BD miBd = new BD();
        Usuario usuario = miBd.LogIn(email, passwordIntentada);
        if(usuario == null){
            ViewBag.mensaje = "Nombre de usuario inexistente";
            return RedirectToAction("Index");
        }
        else{
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
    public IActionResult CrearCuenta(string nombre, string apellido, string email, int telefono, string password, string username, DateTime fecha, IFormFile foto, int idUsuario)
    {
        BD miBd = new BD();

        if (miBd.ExisteCuenta(username, email, telefono) == "")
        {
            ViewBag.mensaje = "El nombre de usuario, el Email o el telefono se encuentra en uso.";
            return View("SignUp");
        }
        else{
            string nombreArchivo = "default.png";
            Usuario nuevo = new Usuario (nombre, apellido, email, telefono, password, username, fecha, foto, idUsuario);
            if (foto != null && foto.Length > 0)
            {
                string carpeta = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images");
                nombreArchivo = Path.GetFileName(foto.FileName);
                string rutaCompleta = Path.Combine(carpeta, nombreArchivo);
                using (var stream = new FileStream(rutaCompleta, FileMode.Create))
                {
                    foto.CopyTo(stream);
                }
            }
        // miBd.AgregarUsuario(nombre, apellido, password, username, nombreArchivo);
            ViewBag.mensaje = "Cuenta creada correctamente.";
        }
        return RedirectToAction("Home", "Home");
    } 
    

}