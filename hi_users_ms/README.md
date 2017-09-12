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



 
 >  http://192.168.99.101:3000/auth/sign_in
 + POST
 + Inicia Sesión
	{
		"email":"juasmartinezbel@unal.edu.co",
		"password": "123456789"
	}
 

 >  http://192.168.99.101:3000/auth/sign_out
 - DELETE
 + Cierra Sesión
 
  >  http://192.168.99.101:3000/welcum
 + GET
 + Ruta de prueba de funcionamiento de tokens

   >  http://192.168.99.101:3000/users
 + GET
 + Regresa todos los usuarios


 Existen otras rutas, pero estas son nada más para cuestiones de prueba.
  
```

# PARA PROBAR:

El Archivo `My_database.yml` debe remplazar a Database en `/config/database.yml`

Verificar que las extensiones y sockets presentes en este sean los indicados
Verificar también `docker-compose.yml` & `Dockerfile`

Correr `start.sh`