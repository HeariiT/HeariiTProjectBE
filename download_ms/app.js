var express = require('express');
var bodyParser = require('body-parser');
var mongoose = require('mongoose');
var router = require("./routes");
var app = express()

const HOST = '0.0.0.0';
const PORT = 3003;

// connect to DB
mongoose.connect('mongodb://localhost/songs');

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }))

// parse application/json
app.use(bodyParser.json())

// API routes
app.use("/",router);

// Server Start at Port
app.listen(PORT, HOST);
