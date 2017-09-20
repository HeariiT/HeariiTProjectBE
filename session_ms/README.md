
Basic installation:
  sudo pip install requests
  pip install Flask-JWT
  pip install Flask-SQLAlchemy

Mysql table creation:
  mysql -u root -p
  //password = 123
  drop database session_db;
  create database session_db;
  use session_db;
  show tables;


Rutas básicas :

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
  + POST
  + Refresh Token
  {
    "email":"juasmartinezbel@unal.edu.co",
    "password": "123456789"
  }

  + Required Headers 'x-access-token' and a valid token

  + returns a  new JWT token

  { "token":              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imp1YXNtYXJ0aW5lemJlbEB1bmFsLmVkdS5jbyIsImV4cCI6MTUwNTk0ODk4MX0.88cXY2l5HppIn--Gycvjm7TYSWXXIB0Tw7VSUjBRP40"
  }

  >  http://192.168.99.101:3001/validate
  + POST
  + validate current token
  {
    "email":"juasmartinezbel@unal.edu.co",
    "password": "123456789"
  }

  + Required Headers 'x-access-token' and a  token to validate

  + returns message
  {
    'email' : 'juasmartinezbel@unal.edu.co!'
  }
