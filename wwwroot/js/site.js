// #region PASSWORD
const togglePassword = document.getElementById('togglePassword');
const password1 = document.getElementById('password');

    togglePassword.addEventListener('click', function () {
      const type = password1.getAttribute('type') === 'password' ? 'text' : 'password';
      password1.setAttribute('type', type);

      // Cambiar el ícono (ojito abierto/cerrado)
      this.classList.toggle('fa-eye');
      this.classList.toggle('fa-eye-slash');
    });

const password2 = document.getElementById('pass-confirm');
togglePassword.addEventListener('click', function () {
  const type = password2.getAttribute('type') === 'password' ? 'text' : 'password';
  password2.setAttribute('type', type);

  // Cambiar el ícono (ojito abierto/cerrado)
  this.classList.toggle('fa-eye');
  this.classList.toggle('fa-eye-slash');
});

// #end region PASSWORD

// loader -- ver si va acá o no
  window.addEventListener("load", function() {
  // tiempo que tardó la consulta a la BD (desde tu ViewBag)
  const tiempoBD = ViewBag.TiempoConsulta ?? 0; 
  const tiempoExtra = 2000; // 2 segundos extra
  const total = tiempoBD + tiempoExtra;

  setTimeout(() => {
      // Oculta tu loader de la librería
      // ejemplo 1: si es un div
      document.getElementById("miLoader").style.display = "none";

      // ejemplo 2: si la librería tiene método hide()
      // Loader.hide();

      // Muestra el contenido
      document.getElementById("contenido").style.display = "block";
      }, total);
  });