#   README
### Rutas básicas :
 
```diff
 > http://192.168.99.101:3000auth
 + POST
 + Registra Usuarios
 {
	"email":"juasmartinezbel@unal.edu.co",
	"password": "123456789",
	"username": "juasmartinezbel",
	"first_name": "Juan Sebastián",
	"last_name": "Martinez Beltrán"
}

   >  http://192.168.99.101:3000/auth
 + PUT
 + edita los usuarios

 
 >  http://192.168.99.101:3000/auth/sign_in
 + POST
 + Inicia Sesión
	{
		"email":"juasmartinezbel@unal.edu.co",
		"password": "123456789"
	}
 
   >  http://192.168.99.101:3000/users
 + GET
 + Regresa todos los usuarios

   >  http://192.168.99.101:3000/users/{id}
 + GET
 + Regresa un usuario dado su id

    >  http://192.168.99.101:3000/users/me
 + GET
 + Regresa mi usuario.



 Existen otras rutas, pero estas son nada más para cuestiones de prueba.
  
```