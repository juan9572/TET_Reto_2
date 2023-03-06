const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
require('dotenv').config()

// Establecer la dirección IP del servidor y el puerto desde las variables de entorno
const serverIP = process.env.IP_INVENTORY + ':' + process.env.PORT_INVENTORY;
const PATH = process.env.PROTO_PATH_INVENTORY;
const inventoryPackageDefinition = protoLoader.loadSync(
    PATH, {
    keepCase: true,
    longs: String,
    enums: String,
    defaults: true,
    oneofs: true
});

// Cargar el archivo de definición del búfer de protocolo para el servicio de inventario
const inventoryPackage = grpc.loadPackageDefinition(inventoryPackageDefinition).com.inventario.product.interfaces;
const inventoryService = new inventoryPackage.ProductService(serverIP, grpc.credentials.createInsecure());

// Función para crear un nuevo producto en el inventario
function createProduct(request, response) {
    // Extraer los datos del producto del cuerpo de la solicitud
    const product = {
        name: request.body.name,
        description: request.body.description,
        price: request.body.price,
        stock_quantity: request.body.stock_quantity,
        seller: request.body.seller
    };
    // Llamar al servicio gRPC para crear el producto
    inventoryService.createProduct({ product: product }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error creando producto' });
        } else {
            response.status(200).json({ message: grpcResponse.messageOfConfirmation });
        }
    });
}

// Función para consultar los productos creados
function readProduct(request, response) {
    // Determinar si el nombre del producto está en el cuerpo de la petición o en el parámetro URL
    const name = request.body.name ? request.body.name : request.params.name;
    // Llamar al servicio gRPC para leer el producto
    inventoryService.readProduct({ name: name }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error obteniendo producto' });
        } else {
            response.status(200).json({ product: grpcResponse.product });
        }
    });
}

// Función para consultar los productos creados utilizando una Promise.
function readProductGrpc(name) {
    return new Promise((resolve, reject) => {
        inventoryService.readProduct({ name: name }, (error, grpcResponse) => {
            if (error) {
                console.error(error);
                reject({ message: 'Error obteniendo producto' });
            } else {
                // Obtiene la información del producto
                const product = {
                    name: grpcResponse.product.name,
                    description: grpcResponse.product.description,
                    price: grpcResponse.product.price,
                    stock_quantity: grpcResponse.product.stock_quantity,
                    seller: grpcResponse.product.seller
                };
                resolve(product);
            }
        });
    });
}

// Esta función trae todos los productos del servidor y los devuelve en la respuesta
function getAllProducts(request, response) {
    inventoryService.getAllProducts({}, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error obteniendo los productos' });
        } else {
            response.status(200).json({ products: grpcResponse.product });
        }
    });
}

// Esta función actualiza los producto
function updateProduct(request, response) {
    // Determinar si el nombre del producto está en el cuerpo de la petición o en el parámetro URL
    const name = request.body.pastName ? request.body.pastName : request.params.name;
    // Obtiene la información del producto
    const product = {
        name: request.body.name,
        description: request.body.description,
        price: request.body.price,
        stock_quantity: request.body.stock_quantity,
        seller: request.body.seller
    };
    inventoryService.updateProduct({ name: name, product: product }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error actualizando producto' });
        } else {
            response.status(200).json({ message: grpcResponse.messageOfConfirmation });
        }
    });
}

// Esta función borra del servidor el producto con el nombre dado
function deleteProduct(request, response) {
    // Determinar si el nombre del producto está en el cuerpo de la petición o en el parámetro URL
    const name = request.body.name ? request.body.name : request.params.name;
    inventoryService.deleteProduct({ name: name }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error borrando producto' });
        } else {
            response.status(200).json({ message: grpcResponse.messageOfConfirmation });
        }
    });
}

// Exporta todas las funciones de inventario para que pueda ser utilizado por otros módulos
module.exports = {
    createProduct,
    readProduct,
    getAllProducts,
    updateProduct,
    deleteProduct,
    readProductGrpc
};
