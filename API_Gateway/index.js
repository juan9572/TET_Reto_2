const express = require('express');
const bodyParser = require('body-parser');
const inventoryCalls = require('./microservice_calls/inventoryMicroservice');
const orderCalls = require('./microservice_calls/shippingMicroservice');
const reviewCalls = require('./microservice_calls/reviewsMicroservice');
require('dotenv').config()

// Instanciación de la aplicación de Express
const app = express();
// Configuración para el uso de JSON en el cuerpo de las solicitudes
app.use(bodyParser.json());

// Rutas para las operaciones de productos
app.post('/product/create', inventoryCalls.createProduct); // Crea un producto
app.get('/product/get/:name', inventoryCalls.readProduct); // Obtiene un producto por su nombre
app.get('/product/all', inventoryCalls.getAllProducts); // Obtiene todos los productos
app.put('/product/update/:name', inventoryCalls.updateProduct); // Actualiza un producto por su nombre
app.delete('/product/delete/:name', inventoryCalls.deleteProduct); // Elimina un producto por su nombre

// Rutas para las operaciones de órdenes
app.post('/order/create', orderCalls.createOrder); // Crea una orden
app.get('/order/get/:name', orderCalls.getOrder); // Obtiene una orden por su nombre
app.put('/order/update/:name', orderCalls.updateOrder); // Actualiza una orden por su nombre

// Ruta para las operaciones de reseñas
app.post('/review/create', reviewCalls.createReview); // Crea una resena

// Inicia el servidor en el puerto especificado en el archivo .env
app.listen(process.env.PORT_SERVER, () => {
    console.log('Servidor corriendo en puerto ' + process.env.PORT_SERVER);
});
