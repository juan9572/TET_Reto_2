const grpc = require('@grpc/grpc-js');
const protoLoader = require('@grpc/proto-loader');
const orderCalls = require('./shippingMicroservice');
require('dotenv').config()

// Configuración de las variables de entorno
const serverIP = process.env.IP_REVIEWS + ':' + process.env.PORT_REVIEWS; // Dirección IP y puerto del servidor de resenas
const PATH = process.env.PROTO_PATH_REVIEWS; // Ruta del archivo proto
const reviewPackageDefinition = protoLoader.loadSync(
    PATH, {
    keepCase: true,
    longs: String,
    enums: String,
    defaults: true,
    oneofs: true
});

// Carga la definición del paquete de reseñas
const reviewPackage = grpc.loadPackageDefinition(reviewPackageDefinition).reviews.interface;
const reviewService = new reviewPackage.ReviewService(serverIP, grpc.credentials.createInsecure());

// Función para crear una reseña
function createReview(request, response) {
    // Obtiene la información de la orden de envío correspondiente al producto
    orderCalls.getOrderGRPC(request.body.name).then((orderResponse) => {
        // Si no se encuentra la orden, devuelve un error
        if (!orderResponse.buyer) {
            response.status(500).json({ message: 'Error no se encontro orden de envio' });
            return;
        }
        // Crea la resena a partir de los datos de la orden y los proporcionados por el usuario
        const review = {
            nameBuyer: orderResponse.buyer,
            nameProduct: request.body.name,
            commentary: request.body.commentary,
            puntuation: request.body.puntuation
        };
        // Llama al servicio de reseñas para crear la resena
        reviewService.createReview({ review: review }, (error, grpcResponse) => {
            if (error) {
                console.error(error);
                response.status(500).json({ message: 'Error creando resena' });
            } else {
                response.status(200).json({ message: grpcResponse.messageOfConfirmation });
            }
        });
    });
}

// Exporta la función de creación de resenas para que pueda ser utilizada por otros módulos
module.exports = {
    createReview
};
