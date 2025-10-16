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