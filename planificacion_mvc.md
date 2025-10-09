Models:
bd:
- sin propiedades, conectado a la base de datos
usuario: 
- id
- nombre
- apellido
- email
- nroTelefono
- username
- foto
- bio
- fechaNacimiento
- contraseña
- ubicacion
- lista de destinos (en la bd es otra tabla)
- idOrbit-usuario
orbit-usuario:
- idUsuario
- idOrbit
orbit:
- id
- nombre
- link?
- idOrbit-usuario / lista de users
ranking:
- id
- lugar (ip)?
- puntuacion

Controllers:
- home: recorridos (rankings)
- orbit: orbits (conecta usuarios) (capaz que se junta y hay solo 2?)
- user: usuarios

Views:
- index: login
- sign up: registro a la base de datos (crea cuentas)
- permisos: habilita permisos al crear la cuenta, y podés pegar el link de invitación a un orbit
- home: conecta otras views y se ve un mapa
- sos: permite llamar a contactos del orbit o nros. de emergencia
- perfil: usuario puede editar sus datos y foto, y cambiar permisos
- perfil ajeno: permite ver foto, username, bio, y ubicación de otra persona
- destinos: muestra listas de destinos guardados por el usuario
- menu orbit: todos los orbits a los que pertenece un usuario, y podés pegar el link de invitación a un orbit
- orbit: ves todos los usuarios que forman parte y sus ubicaciones, podés agregar a alguien, compartir el link?, o ir a la configuración
- configuracion: como perfil, podes editar los datos del orbit
