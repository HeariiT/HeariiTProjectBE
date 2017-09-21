# Leeme

Rutas:

 * Obtener todas las canciones

 	```
    GET 192.168.99.101:3002/songs
    
    Acá pueden usar parámetros como firstResult y maxResult, recuerden:
    
    192.168.99.101:3002/songs?firstResult=xxx&maxResult=yyy
    
    ```  
    
 * Obtener una canción por ID
 
 	```
    GET 192.168.99.101:3002/songs/:id
    ``` 
    
 * Obtener todas las canciones de un usuario por su ID
 
 	```
    GET 192.168.99.101:3002/songs/user/:user_id
    ``` 
    
 * Cargar una canción
 
 	```
    POST 192.168.99.101:3002/songs
    ``` 
    
    ```json
    {
    	"user_id": xxx,
        "attachment": (cargar como archivo si se está usando POSTMAN)
    }
    ``` 
    
 * Borrar una canción dado su ID
 
 	```
    DELETE 192.168.99.101:3002/songs/:id
    ``` 
    
 * Borrar todas las canciones de un usuario por su ID
 
 	```
    DELETE 192.168.99.101:3002/songs/user/:user_id