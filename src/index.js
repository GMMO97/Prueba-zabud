const express = require('express');
var app = express();

//Configuracion
app.set('port', process.env.PORT || 3000);

//Middlewares
app.use(express.json());


//Rutas
app.use('/api/car',require('./routers/car.js'));

//Archivos estaticos
app.use(express.static(__dirname + '/public'));



//Inicio del servidor 
app.listen(app.get('port'),()=>{
    console.log("Servidor escuchando en el puerto " ,app.get('port'));
})