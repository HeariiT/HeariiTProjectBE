#   README
### Rutas básicas :
 
```diff
 > localhost:3000/auth
 + POST
 + Registra Usuarios
 
 >  localhost:3000/auth/sign_in
 + POST
 + Inicia Sesión
 
 >  localhost:3000/auth/sign_out
 - DELETE
 + Cierra Sesión
 
  >  localhost:3000/auth/welcum
 + GET
 + Ruta de prueba

 Existen otras rutas, pero estas son nada más para cuestiones de prueba.
  
```

# PARA PROBAR:

El Archivo `My_database.yml` debe remplazar a Database en `/config/database.yml`

Verificar que las extensiones y sockets presentes en este sean los indicados
Verificar también `docker-compose.yml` & `Dockerfile`

Correr `start.sh`