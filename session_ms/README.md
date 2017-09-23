#   README


## After running /.start.sh
  * To use session_ms you need to create the table in session_db, so if you are using rancher go to session_db 's shell and run the commands of [Link to Header](#mysql-table-creation)

## Mysql table creation:
  * mysql -u root -p
  * //password = 123;
  * use session_db;
  * create table revoked_token (id int not null auto_increment primary key, rToken varchar(255) unique);
  * exit


## Routes :

 ```diff

 >  http://192.168.99.101:3001/sign_in
 + POST
 + Log in
	{
		"email":"juasmartinezbel@unal.edu.co",
		"password": "123456789"
	}
  + returns a  JWT token
  { "token":              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imp1YXNtYXJ0aW5lemJlbEB1bmFsLmVkdS5jbyIsImV4cCI6MTUwNTk0ODk4MX0.88cXY2l5HppIn--Gycvjm7TYSWXXIB0Tw7VSUjBRP40"
  }

  >  http://192.168.99.101:3001/sign_out
  + POST
  + Log out
 	{
 		"email":"juasmartinezbel@unal.edu.co",
 		"password": "123456789"
 	}

  + Required Headers 'x-access-token' and a valid token

  + returns message
  {
    'message' : 'You are out!'
  }

  >  http://192.168.99.101:3001/refresh
  + GET
  + Refresh Token

  + Required Headers 'x-access-token' and a valid token

  + returns a  new JWT token

  { "token":              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imp1YXNtYXJ0aW5lemJlbEB1bmFsLmVkdS5jbyIsImV4cCI6MTUwNTk0ODk4MX0.88cXY2l5HppIn--Gycvjm7TYSWXXIB0Tw7VSUjBRP40"
  }

  >  http://192.168.99.101:3001/validate
  + GET
  + Validate current token

  + Required Headers 'x-access-token' and a  token to validate

  + returns message
  {
    'email' : 'juasmartinezbel@unal.edu.co!'
  }

  ```
