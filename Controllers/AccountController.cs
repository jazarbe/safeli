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

    private readonly BD miBd;

    public Account(BD bd)
    {
        miBd = bd;
    }

    public async Task<IActionResult> LogIn(string email, string password)
    {
        Usuario usuario = await miBd.LogIn(email, password); //ns si está bien
        if(usuario == null){
            ViewBag.mensaje = "Nombre de usuario inexistente";
            return RedirectToAction("Index");
        }
        else{
            HttpContext.Session.SetInt32("IdUsuario", usuario.id);
            return RedirectToAction("Home");
        }
    }

    public IActionResult LogOut()
    {
        HttpContext.Session.Clear();
        return RedirectToAction("Index", "Home");
    }

    public async Task<IActionResult> CambiarPassword(string username, string nuevaContraseña)
    {
        if (miBd.BuscarUsuarioPorUsername(username) == null)
        {
            ViewBag.mensaje = "El usuario no existe";
            return View("OlvidePassword");
        }
        
        await miBd.CambiarContraseña(username, nuevaContraseña);

        ViewBag.mensaje = "Contraseña cambiada correctamente";
        // loader y dps home
        return RedirectToAction("Index", "Home");
    }
    public async Task<IActionResult> CrearCuenta(string nombre, string apellido, string email, int telefono, string password, string username, DateOnly fecha, IFormFile foto, string bio)
    {

        if (miBd.ExisteCuenta(username, email, telefono) == null) //ver si funciona
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
            await miBd.AgregarUsuario(nombre, apellido, email, telefono, username, password, fecha, rutaCompleta, bio);
            ViewBag.mensaje = "Cuenta creada correctamente.";
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
        return View(); 
    }
    public async Task<IActionResult> OtherProfile(int id)
    {
        Usuario user = await miBd.BuscarUsuarioPorId(id);
        ViewBag.Username = user.username;
        ViewBag.Biografia = user.bio;
        ViewBag.Point = user.ubicacion;
        return View(); 
    }
    public IActionResult Permisos( )
    {
        return View(); 
    }
}