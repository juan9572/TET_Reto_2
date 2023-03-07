const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const inventoryCalls = require('./inventoryMicroservice');
require('dotenv').config()

// Configuración de las variables de entorno
const serverIP = process.env.IP_SHIPPING + ':' + process.env.PORT_SHIPPING; // Obtiene la dirección IP y el puerto del servidor de envío desde una variable de entorno
const PATH = process.env.PROTO_PATH_SHIPPING;  // Obtiene la ruta del archivo proto desde una variable de entorno
const shippingPackageDefinition = protoLoader.loadSync(
    PATH, {
    keepCase: true,
    longs: String,
    enums: String,
    defaults: true,
    oneofs: true
});

// Carga la definición del paquete de envios
const shippingPackage = grpc.loadPackageDefinition(shippingPackageDefinition).shipping.interfaces;
const shippingService = new shippingPackage.OrderService(serverIP, grpc.credentials.createInsecure());

// Función para crear una orden
function createOrder(request, response) {
    // Obtiene la información del producto
    inventoryCalls.readProductGrpc(request.body.name).then((productResponse) => {
        stock = productResponse.stock_quantity;
        price = productResponse.price;
        // Sino existe el producto o no hay stock de este, se produce un error
        if (!(stock && stock > 0)) {
            response.status(200).json({ message: 'Error no hay producto en stock' });
            return;
        }
        // Crea la orden a partir de los datos del producto y los proporcionados por el usuario
        const order = {
            statusPurchase: request.body.statusPurchase,
            buyer: request.body.buyer,
            name: request.body.name,
            price: price,
            address: request.body.address,
            phoneBuyer: request.body.phoneBuyer,
            cityDelivery: request.body.cityDelivery
        };
        // Llama al servicio de envios para crear la orden
        shippingService.createOrder({ order: order }, (error, grpcResponse) => {
            if (error) {
                console.error(error);
                response.status(500).json({ message: 'Error creando orden' });
            } else {
                response.status(200).json({ message: grpcResponse.messageOfConfirmation });
            }
        });
    });
}

// Función para crear una orden
function getOrder(request, response) {
    // Determinar si el nombre del producto está en el cuerpo de la petición o en el parámetro URL
    const name = request.body.name ? request.body.name : request.params.name;
    shippingService.getOrder({ name: name }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error obteniendo orden' });
        } else {
            response.status(200).json({ order: grpcResponse.order });
        }
    });
}

// Función para consultar las ordenes creadas utilizando una Promise.
function getOrderGRPC(name) {
    return new Promise((resolve, reject) => {
        shippingService.getOrder({ name: name }, (error, grpcResponse) => {
            if (error) {
                console.error(error);
                reject({ message: 'Error obteniendo producto' });
            } else {
                // Obtiene la información de la orden
                const order = {
                    statusPurchase: grpcResponse.order.statusPurchase,
                    buyer: grpcResponse.order.buyer,
                    name: grpcResponse.order.name,
                    price: grpcResponse.order.price,
                    address: grpcResponse.order.address,
                    phoneBuyer: grpcResponse.order.phoneBuyer,
                    cityDelivery: grpcResponse.order.cityDelivery
                };
                resolve(order);
            }
        });
    });
}

// Función para consultar las ordenes creadas utilizando una Promise.
function updateOrder(request, response) {
    // Determinar si el nombre del producto está en el cuerpo de la petición o en el parámetro URL
    const name = request.body.pastName ? request.body.pastName : request.params.name;
    // Obtiene la información de la orden
    const order = {
        statusPurchase: request.body.statusPurchase,
        buyer: request.body.buyer,
        name: request.body.name,
        price: request.body.price,
        address: request.body.address,
        phoneBuyer: request.body.phoneBuyer,
        cityDelivery: request.body.cityDelivery
    };
    shippingService.updateOrder({ name: name, order: order }, (error, grpcResponse) => {
        if (error) {
            console.error(error);
            response.status(500).json({ message: 'Error actualizando orden' });
        } else {
            response.status(200).json({ message: grpcResponse.messageOfConfirmation });
        }
    });
}

// Exporta todas las funciones de envios para que pueda ser utilizado por otros módulos
module.exports = {
    createOrder,
    getOrder,
    updateOrder,
    getOrderGRPC
};
