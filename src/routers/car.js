const express = require('express');
const router = express.Router();

const mysqlConnection = require('../connection.js');

//listar todos los carros
router.get('/', (req, res) => {
    mysqlConnection.query('SELECT * FROM carros', (err, filas, campos) => {
        if (!err) {
            res.json(filas);
        } else {
            console.log(err);
        }
    });
});

//listar carro por id
router.get('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('SELECT * FROM carros WHERE id = ?', [id], (err, filas, campos) => {
        if (!err) {
            res.json(filas[0]);
        } else {
            console.log(err);
        }

    })
});

//Agregar carro
router.post('/', (req,res) =>{
    const {id,marca,modelo,color} = req.body;
    const query = `CALL agregaryeditarcarros(?,?,?,?)`;
    mysqlConnection.query(query, [id,marca,modelo,color],(err, filas, campos) => {
        if (!err) {
            res.json({Status:'Carro guardado'});
        } else {
            console.log(err);
        }
    })
});

//Actualizar carros
router.put('/:id', (req,res) =>{
    const {marca,modelo,color} = req.body;
    const { id } = req.params;

    const query = `CALL agregaryeditarcarros(?,?,?,?)`;

    mysqlConnection.query(query, [id,marca,modelo,color],(err, filas, campos) => {
        if (!err) {
            res.json({Status:'Carro actualizado'});
        } else {
            console.log(err);
        }
    })
});

//Eliminar carros
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    mysqlConnection.query('DELETE  FROM carros WHERE id = ?', [id], (err, filas, campos) => {
        if (!err) {
            res.json({Status:'Carro Eliminado'});
        } else {
            console.log(err);
        }

    })
});



//a
module.exports = router;