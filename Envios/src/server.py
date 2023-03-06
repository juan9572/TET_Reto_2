# Importamos los módulos necesarios
import os
import grpc
from concurrent import futures
from dotenv import load_dotenv
from pymongo import MongoClient
import shipping_pb2_grpc
from services.orderService import OrderService

# Creamos una clase llamada Server para correr el servidor gRPC
class Server:
    # Definimos un método llamado runServe que toma un objeto cliente como argumento
    def runServe(self, client):
        # Imprimimos un mensaje de inicio del servidor y el puerto en el que está escuchando
        print("--------Iniciando servidor gRPC en el puerto " + os.getenv("PORTGRPC") +"--------")
        # Creamos un objeto servidor gRPC con 10 workers
        server = grpc.server(futures.ThreadPoolExecutor(max_workers = 10))
        # Agregamos el servicio OrderService al servidor
        shipping_pb2_grpc.add_OrderServiceServicer_to_server(OrderService(client), server)
        # Agregamos el puerto en el que se va a escuchar
        server.add_insecure_port("[::]:" + os.getenv("PORTGRPC"))
        # Iniciamos el servidor
        server.start()
        # Imprimimos un mensaje que indica que el servidor está escuchando peticiones
        print("--Escuchando peticiones....--")
        # Esperamos a que se terminen las peticiones
        server.wait_for_termination()

# Si este script es el que se está ejecutando, no es un módulo importado.
# Por lo tanto, ejecutamos el código.
if __name__ == "__main__":
    # Cargamos las variables de entorno del archivo .env
    load_dotenv()
    # Imprimimos un mensaje que indica que se está estableciendo la conexión con la base de datos
    print("--------Estableciendo conexion con DB--------")
    # Creamos un objeto cliente de MongoDB con la dirección IP y puerto indicados en las variables de entorno
    client = MongoClient("mongodb://" + os.getenv("IPMONGO") + ":" + os.getenv("PORTMONGO"))
    # Imprimimos un mensaje que indica que la conexión con la base de datos se ha establecido correctamente
    print("--Conexion OK--")
    # Creamos un objeto de la clase Server
    server = Server()
    # Ejecutamos el método runServe de la clase Server con el objeto cliente como argumento
    server.runServe(client)
    # Imprimimos un mensaje que indica que el servidor se ha finalizado
    print("--------Finalizando servidor gRPC--------")
    print("--------Finalizando conexion a DB--------")
    # Cerramos la conexión con la base de datos
    client.close()
