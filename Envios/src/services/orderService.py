import shipping_pb2
import shipping_pb2_grpc

class OrderService(shipping_pb2_grpc.OrderServiceServicer):
    database = None
    collection = None

    def __init__(self, client):
        # Constructor que inicializa la base de datos y la colección de órdenes
        self.database = client["inventario"]
        self.collection = self.database["orders"]

    def createOrder(self, request, context):
        # Método que inserta una nueva orden en la base de datos
        print("--------Realizando peticion de CREATE--------")
        order = request.order
        self.collection.insert_one({
            'statusPurchase': order.statusPurchase,
            'buyer': order.buyer,
            'name': order.name,
            'price': order.price,
            'address': order.address,
            'phoneBuyer': order.phoneBuyer,
            'cityDelivery': order.cityDelivery
        })
        # Crea una respuesta con un mensaje de confirmación de que la orden ha sido creada correctamente
        response = shipping_pb2.CreateOrderResponse(
            messageOfConfirmation = f'La orden de {order.name} ha sido creada correctamente'
        )
        print("--CREATE OK!--")
        return response

    def getOrder(self, request, context):
        # Método que busca una orden en la base de datos según su nombre
        print("--------Realizando peticion de GET--------")
        order = self.collection.find_one({"name": request.name})
        # Crea una respuesta con la información de la orden encontrada
        response = shipping_pb2.GetOrderResponse(
            order=shipping_pb2.Order(
                statusPurchase=order['statusPurchase'],
                buyer=order['buyer'],
                name=order['name'],
                price=order['price'],
                address=order['address'],
                phoneBuyer=order['phoneBuyer'],
                cityDelivery=order['cityDelivery']
            )
        )
        print("--GET OK!--")
        return response

    def updateOrder(self, request, context):
        # Método que actualiza una orden existente en la base de datos
        print("--------Realizando peticion de UPDATE--------")
        order = request.order
        self.collection.update_one(
            {'name': request.name},
            {'$set': {
                'statusPurchase': order.statusPurchase,
                'buyer': order.buyer,
                'name': order.name,
                'price': order.price,
                'address': order.address,
                'phoneBuyer': order.phoneBuyer,
                'cityDelivery': order.cityDelivery
            }}
        )
        # Crea una respuesta con un mensaje de confirmación de que la orden ha sido actualizada correctamente
        response = shipping_pb2.UpdateOrderResponse(
            messageOfConfirmation = f'La orden ha {order.name} sido actualizada correctamente'
        )
        print("--UPDATE OK!--")
        return response