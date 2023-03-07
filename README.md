# TET_Reto_N1
> Repositorio para alojar la solución al reto #1 sobre microservicios comunicándose con gRPC.
## Tabla de contenidos:
---

1.  [Información de la asignatura](#información-de-la-asignatura)

2. [Datos del estudiante](#datos-del-estudiante)

3. [Descripción y alcance del proyecto](#descripción-y-alcance-del-proyecto)

4. [Estructura del proyecto](#estructura-del-proyecto)

5. [Arquitectura de la solución planteada](#arquitectura-de-la-solución-planteada)

6. [Resultados logrados](#resultados-logrados)

7. [Descripción técnica de la solución implementada](#descripción-técnica-de-la-solución-implementada)
	- [API_Gateway](#api_gateway)
		- [Tecnologías usadas y ejecución de API](#tecnologías-usadas-y-ejecución-de-api)
		- [Librerías de API](#librerías-de-api)
		- [Parametrización de API](#parametrización-de-api)
	- [Envios](#envios)
		- [Tecnologías usadas y ejecución de Envios](#tecnologías-usadas-y-ejecución-de-envios)
		- [Librerías de Envios](#librerías-de-envios)
		- [Parametrización de Envios](#parametrización-de-envios)
	- [Inventario](#inventario)
		- [Tecnologías usadas y ejecución de Inventario](#tecnologías-usadas-y-ejecución-de-inventario)
		- [Librerías de Inventario](#librerías-de-inventario)
		- [Parametrización de Inventario](#parametrización-de-inventario)
	- [Resena](#resena)
		- [Tecnologías usadas y ejecución de Resena](#tecnologías-usadas-y-ejecución-de-resena)
		- [Librerías de Resena](#librerías-de-resena)
		- [Parametrización de Resena](#parametrización-de-resena)

8. [Guía de uso](#guía-de-uso)
	- [Peticiones de microservicio inventario](#peticiones-de-microservicio-inventario)
		- [createProduct](#createproduct)
		- [readProduct](#readproduct)
		- [getAllProducts](#getallproducts)
		- [updateProduct](#updateproduct)
		- [deleteProduct](#deleteproduct)
	- [Peticiones de microservicio envíos](#peticiones-de-microservicio-envíos)
		- [createOrder](#createorder)
		- [getOrder](#getorder)
		- [updateOrder](#updateorder)
	-  [Peticiones de microservicio reseñas](#peticiones-de-microservicio-reseñas)
		- [createReview](#createreview)
9. [Referencias](#referencias) 

## Información de la asignatura
---

 -  **Nombre de la asignatura:** Tópicos especiales en telemática.
-   **Código de la asignatura:**  C2361-ST0263-4528
-   **Departamento:** Departamento de Informática y Sistemas (Universidad EAFIT).
-   **Nombre del profesor:** Juan Carlos Montoya Mendoza.
-  **Correo electrónico del docente:** __[jcmontoy@eafit.edu.co](mailto:jcmontoy@eafit.edu.co)__.

## Datos del estudiante
---

-   **Nombre del estudiante:** Juan Pablo Rincon Usma.
-  **Correo electrónico del estudiante:** __[jprinconu@eafit.edu.co](mailto:jprinconu@eafit.edu.co)__.

## Descripción y alcance del proyecto
---

El proyecto consiste en un sistema de microservicios que se comunican mediante gRPC. Los microservicios tienen las siguientes funcionalidades:

1.  El primer microservicio está escrito en **Java*** y se encarga de la **gestión de un CRUD de productos** en una base de datos en **MongoDB**, __simulando el comportamiento de un inventario__.
2.  El segundo microservicio está escrito en **Python** y se encarga de **verificar que exista un producto para poder realizar una orden de envío.** También tiene conexión con su propia base de datos en **MongoDB y tiene un CRUD sin delete para las órdenes.**
3.  El tercer microservicio está escrito en **Dart** y se encarga de **verificar que exista una orden de compra para poder hacer una reseña sobre un producto.** También tiene su persistencia en una base de datos en **MongoDB**, pero solo realiza operaciones de **CREATE.**

Se ha implementado una API Gateway que se comunica con el cliente a través de REST y con el backend mediante gRPC. Además, se ha logrado comunicar los tres microservicios y agregarles su propia persistencia de datos.

El objetivo del proyecto es demostrar la implementación de un sistema de microservicios con gRPC y MongoDB, así como la utilización de una API Gateway. Se logró implementar la comunicación entre microservicios, persistencia de datos y la API Gateway.

## Estructura del proyecto
---

Como lo mencionamos se implementaron 3 microservicios y 1 API Gateway, la estructura del proyecto se organiza en diferentes carpetas y archivos para lograr una buena separación de responsabilidades y una fácil mantenibilidad. Cada microservicio tiene su propia carpeta con su código fuente, sus dependencias y sus archivos de configuración, mientras que la API Gateway se encuentra en su propia carpeta. Además, se han utilizado algunas herramientas y patrones para lograr una arquitectura escalable y robusta. A continuación, se detallará la estructura de cada uno de los archivos de los microservicios y de la API Gateway.

* TET_Reto_N1
    - [API_Gateway](https://github.com/juan9572/TET_Reto_N1/tree/main/API_Gateway "API_Gateway")
	    -  microservice_calls
		    -  [inventoryMicroservice.js](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/microservice_calls/inventoryMicroservice.js "inventoryMicroservice.js")
		    - [reviewsMicroservice.js](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/microservice_calls/reviewsMicroservice.js "reviewsMicroservice.js")
		    - [shippingMicroservice.js](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/microservice_calls/shippingMicroservice.js "shippingMicroservice.js")
	    - node_modules
	    - proto
		    - [product.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/proto/product.proto "product.proto")
		    - [reviews.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/proto/reviews.proto "reviews.proto")
		    - [shipping.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/proto/shipping.proto "shipping.proto")
	    - [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/.env ".env")
	    - [index.js](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/index.js "index.js")
	    - package-lock.json
	    - package.json
    - [Envios](https://github.com/juan9572/TET_Reto_N1/tree/main/Envios "Envios")
        - src
	        - __pycache__
	        - proto
		        - [shipping.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/proto/shipping.proto "shipping.proto")
	        - services
		        - __pycache__
		        - [orderService.py](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/services/orderService.py "orderService.py")
	        - [server.py](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/server.py "server.py")
	        - [shipping_pb2.py](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/shipping_pb2.py "shipping_pb2.py")
	        - [shipping_pb2.pyi](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/shipping_pb2.pyi "shipping_pb2.pyi")
	        - [shipping_pb2_grpc.py](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/shipping_pb2_grpc.py "shipping_pb2_grpc.py")
        - venv
	        - Lib
	        - Scripts
	        - pyvenv.cfg 
        - [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/.env ".env")
     - Img
     - [Inventario](https://github.com/juan9572/TET_Reto_N1/tree/main/Inventario "Inventario")
	     - .idea
	     - grpc-interfaces
		     - src
			     - main
				     - java/com/inventario/product
					     - [App.java](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/grpc-interfaces/src/main/java/com/inventario/product/App.java "App.java")
				     - proto
					     - [product.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/grpc-interfaces/src/main/proto/product.proto "product.proto")
			     - test/java/com/faxterol/grpcdemo
		     - target
		     - grpc-interfaces.iml
		     - [pom.xml](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/grpc-interfaces/pom.xml "pom.xml")
	     - inventario
		     - src
			     - main/java/com/service
				     - interfaceService
					     - [InventarioService.java](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/inventario/src/main/java/com/service/interfaceService/InventarioService.java "InventarioService.java")
				     - [App.java](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/inventario/src/main/java/com/service/App.java "App.java")
			     - test/java/com/service
		     - target
		     - [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/inventario/.env ".env")
		     - inventario.iml
		     - [pom.xml](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/inventario/pom.xml "pom.xml")
     - [Resena](https://github.com/juan9572/TET_Reto_N1/tree/main/Resena "Resena")
	     - .idea
	     - bin
		     - generated/interface
			     - [reviews.pb.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/generated/interface/reviews.pb.dart "reviews.pb.dart")
			     - [reviews.pbenum.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/generated/interface/reviews.pbenum.dart "reviews.pbenum.dart")
			     - [reviews.pbgrpc.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/generated/interface/reviews.pbgrpc.dart "reviews.pbgrpc.dart")
			     - [reviews.pbjson.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/generated/interface/reviews.pbjson.dart "reviews.pbjson.dart")
		     - interface
			      - [ReviewService.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/interface/ReviewService.dart "ReviewService.dart")
		     - [server.dart](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/bin/server.dart "server.dart")
	     - protos
		     - [reviews.proto](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/protos/reviews.proto "reviews.proto")
	     - [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/.env ".env")
	     - analysis_options.yaml
	     - pubspec.lock
	     - [pubspec.yaml](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/pubspec.yaml "pubspec.yaml")
    - [README.md](https://github.com/juan9572/TET_Reto_N1/blob/main/README.md "README.md")

## Arquitectura de la solución planteada
---
![Diagrama de solución implementada](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/Diagrama%20microservicios.png)
La arquitectura de la solución planteada se basa en una arquitectura en capas, donde cada capa se encarga de una función específica en el proceso. La capa del mundo real se encarga de tener un dispositivo que pueda usar el protocolo HTTP 1.1 y poder mandar peticiones al servidor. La API Gateway se encarga de coordinar la comunicación entre dichos microservicios y la comunicación con el usuario. La capa de microservicios se encarga de la lógica de negocio y procesamiento de datos, mientras que la capa de persistencia o acceso a datos se encarga de interactuar con la base de datos y realizar todo tipo de operaciones CRUD.

Además, se han utilizado varios patrones de diseño en la implementación de la solución. Por ejemplo, se ha implementado:
*  El patrón de Inyección de Dependencias, que permite que los objetos dependientes sean creados por un contenedor de inversión de control en lugar de ser creados por la propia clase. 
* El Patrón Singleton: en la clase App se está utilizando un patrón singleton para la conexión a la base de datos MongoDB. Se garantiza que solo hay una instancia de MongoClient en todo el proceso.
* El Patrón Builder: en la clase App se está utilizando un patrón builder para construir y configurar el servidor gRPC. Se está utilizando la clase ServerBuilder de gRPC para construir el servidor y se está configurando con el puerto proporcionado por el archivo .env.
* El Patrón Factory: en la clase InventarioService se está utilizando un patrón factory para crear instancias de los objetos de respuesta de gRPC. Se están creando objetos CreateProductResponse y UpdateProductResponse mediante la llamada a sus métodos estáticos.
* El Patrón DAO: en la clase InventarioService se está utilizando un patrón DAO para acceder a la base de datos. Se está utilizando la clase MongoCollection para realizar operaciones CRUD en la colección "products" de la base de datos "inventario".

Estos patrones ayudan a lograr una arquitectura escalable y modular, lo que permite una fácil adición de nuevas funcionalidades y un mantenimiento más sencillo en el futuro.

## Resultados logrados
---
En cuanto a los resultados alcanzados, se logró implementar un sistema de microservicios que se comunican usando gRPC. Este sistema se compone de tres microservicios que se encargan de la gestión de un inventario de productos, la verificación de productos para realizar órdenes de envío y la realización de reseñas sobre productos. Cada uno de estos microservicios tiene su propia persistencia de datos en una base de datos en MongoDB.

Además, se implementó una API Gateway que se comunica con el cliente a través de REST y con el backend hablando gRPC. Esto permite que los clientes puedan interactuar con los microservicios sin necesidad de conocer los detalles de la implementación, ya que la API Gateway se encarga de redirigir las solicitudes a los microservicios correspondientes.

Sin embargo, un objetivo que no se logró alcanzar fue el desarrollo de una interfaz gráfica para visualizar los datos de manera más amena. Esto significa que, aunque se pudo implementar la lógica de negocio y el intercambio de información entre los microservicios, no se logró brindar una experiencia de usuario visualmente atractiva e intuitiva.

#### En resumen podríamos decir que:

 >-   Se logró implementar un sistema de microservicios que se comunican usando gRPC.
>-   Cada microservicio tiene su propia persistencia de datos en una base de datos en MongoDB.
>-   Se implementó una API Gateway que se comunica con el cliente a través de REST y con el backend hablando gRPC.
>-   No se desarrolló una interfaz gráfica para visualizar e interactuar con los datos de manera más amena.

## Descripción técnica de la solución implementada
---
Dado que la aplicación cuenta con varios componentes, en este apartado explicaremos qué bibliotecas son necesarias y sus respectivas versiones. También detallaremos cómo realizar una compilación adecuada para garantizar su correcta ejecución, así como la forma de parametrizar los componentes para asegurar un funcionamiento óptimo

### API_Gateway
Este módulo es responsable de proporcionar la comunicación entre los microservicios y los clientes, y se encuentra en la carpeta [API_Gateway](https://github.com/juan9572/TET_Reto_N1/tree/main/API_Gateway "API_Gateway").

#### Tecnologías usadas y ejecución de API:
![Node icono](https://img.shields.io/badge/Node.js-339933?style=for-the-badge&logo=nodedotjs&logoColor=white)
![NPM icono](https://img.shields.io/badge/npm-CB3837?style=for-the-badge&logo=npm&logoColor=white)
![Express icono](https://img.shields.io/badge/Express.js-000000?style=for-the-badge&logo=express&logoColor=white)

Esta API esta realizada en Node.js, para poder correrla deberemos tener instalado [Node](https://nodejs.org/en/) en nuestro computador, una vez tengamos podremos instalar las dependencias necesarias, nos paramos en la carpeta [API_Gateway](https://github.com/juan9572/TET_Reto_N1/tree/main/API_Gateway "API_Gateway") y usando el siguiente comando :
```bash
npm install
```
Una vez tengamos las librerías podemos ejecutar el servidor usando el siguiente comando:
```bash
npm start
```
Si todo esta correcto veremos el siguiente mensaje en consola:
![API Gateway corriendo](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/API_Gateway-corriendo.png)

>Cabe recalcar que yo estoy corriendo la aplicación en el puerto 8080, pero esto se puede parametrizar perfectamente, más adelante mostraremos como podemos correr el server en otro puerto.
>
Ahora podemos empezar a realizar peticiones a nuestra API.
#### Librerías de API:

Las librerías necesarias para poder correr este módulo son:

|Nombre librería| Versión | Propósito | Link |
|--|--|--|--|
| @grpc/grpc-js | 1.8.11 | Proporciona una implementación de cliente y servidor de gRPC (Remote Procedure Call over HTTP/2) para JavaScript basada en Node.js.| https://www.npmjs.com/package/@grpc/grpc-js |
| @grpc/proto-loader | 0.7.5 | Proporciona una forma fácil de cargar archivos de protocolo de buffers de Google (protobufs) en una aplicación Node.js.| https://www.npmjs.com/package/@grpc/proto-loader |
| body-parser | 1.20.2 | Es una dependencia de npm que ayuda a las aplicaciones Node.js a analizar y procesar los datos en el cuerpo de las solicitudes HTTP entrantes.| https://www.npmjs.com/package/body-parser |
| dotenv | 16.0.3 | Proporciona una forma de cargar variables de entorno desde un archivo `.env` en una aplicación Node.js.| https://www.npmjs.com/package/dotenv |
| express| 4.18.2 | Es un framework para aplicaciones web Node.js que facilita la creación de aplicaciones y servicios web.| https://www.npmjs.com/package/express |

#### Parametrización de API:
En esta sección, podemos cambiar las direcciones IP y los puertos en los que se ejecutan nuestros microservicios, así como el puerto en el que se ejecuta el servidor. Para configurar la parametrización, buscaremos el archivo [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/API_Gateway/.env ".env") . Al abrirlo, encontraremos la siguiente información:

```bash
IP_REVIEWS = 'localhost'
PORT_REVIEWS = 50053
PROTO_PATH_REVIEWS = 'proto/reviews.proto'
IP_INVENTORY = 'localhost'
PORT_INVENTORY = 50051
PROTO_PATH_INVENTORY = 'proto/product.proto'
IP_SHIPPING = 'localhost'
PORT_SHIPPING = 50052
PROTO_PATH_SHIPPING = 'proto/shipping.proto'
PORT_SERVER = 8080
```
Como vemos el archivo esta separado por "secciones", en la primera parte encontraremos la definición de las variables necesarias para el microservicio de reseñas, el cual incluye:
* IP_REVIEWS: en que máquina esta el microservicio.
* PORT_REVIEWS: el puerto donde se esta ejecutando en esa máquina.
* PROTO_PATH_REVIEWS: En que lugar se encuentra el archivo .proto de reseñas (*obligatorio* **el mismo archivo .proto que se use aquí debe ser el mismo que este en el server del microservicio**).

Después tenemos la sección del microservicio del inventario, funciona exactamente igual al de reseñas.
* IP_INVENTORY: en que máquina esta el microservicio.
* PORT_INVENTORY: el puerto donde se esta ejecutando en esa máquina.
* PROTO_PATH_INVENTORY: En que lugar se encuentra el archivo .proto de inventario(*obligatorio* **el mismo archivo .proto que se use aquí debe ser el mismo que este en el server del microservicio**).

Más abajo encontramos la sección del microservicio de envíos, este funciona exactamente igual a los 2 anteriores.
* IP_SHIPPING: en que máquina esta el microservicio.
* PORT_SHIPPING: el puerto donde se esta ejecutando en esa máquina.
* PROTO_PATH_SHIPPING: En que lugar se encuentra el archivo .proto de envíos(*obligatorio* **el mismo archivo .proto que se use aquí debe ser el mismo que este en el server del microservicio**).

Por último encontramos el parámetro que nos permite cambiar en que puerto se esta corriendo nuestro API_Gateway, simplemente lo modificamos y este ya empezara a correr desde el puerto especificado.
* PORT_SERVER: puerto donde esta corriendo el API_Gateway

> Estos parámetros son totalmente modificables, solo mucho cuidado con el archivo .proto, este debe existir en el PATH asignado para que se pueda ejecutar correctamente el server.

### Envios

Este módulo es responsable de proporcionar la comunicación entre la API Gateway y la persistencia de datos en MongoDB, además, se encarga de crear ordenes de pedidos si un producto existe en el inventario y se encuentra en la carpeta [Envios](https://github.com/juan9572/TET_Reto_N1/tree/main/Envios "Envios").

#### Tecnologías usadas y ejecución de Envios:
![Python icono](https://img.shields.io/badge/Python-FFD43B?style=for-the-badge&logo=python&logoColor=blue)
![Mongo icono](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
Este microservicio esta realizado en Python, para poder correrlo deberemos tener instalado [Python](https://www.python.org/) en nuestro computador, una vez tengamos python podremos correr el server de gRPC, primero deberemos ejecutar el entorno virtual donde se encuentran las dependencias para ello nos paramos en la carpeta [Envios](https://github.com/juan9572/TET_Reto_N1/tree/main/Envios "Envios") y desde la consola ejecutamos el siguiente comando:
```bash
.\venv\Scripts\activate
```
La consola se nos vera de la siguiente manera:
![VENV](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/Envios_VENV.png)
 Ahora para ejecutarlo buscamos el archivo [server.py](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/src/server.py "server.py") que se encuentra en la carpeta "src" y lo ejecutamos de la siguiente manera:
```bash
python .\server.py
```
En la consola nos debe salir lo siguiente:
![server running envios](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/Envios%20serverRunning.png)
Ahora nuestro microservicio esta listo, escuchando y esperando las peticiones.
#### Librerías de Envios:
Las librerías necesarias para poder correr este módulo son:

|Nombre librería| Versión | Propósito | Link |
|--|--|--|--|
| grpcio | 1.51.3 | Es una biblioteca de Python que proporciona soporte para la implementación del Protocolo de Llamada a Procedimiento Remoto de Google (GRPC) en Python.| https://pypi.org/project/grpcio/ |
| protobuf | 4.22.0 | Proporciona una forma eficiente y flexible de definir estructuras de datos mediante el uso de archivos de definición de mensajes protobuf. Estos archivos de definición describen los campos de datos y su tipo.| https://pypi.org/project/protobuf/ |
| pymongo | 4.3.3 | Es una biblioteca de Python que se utiliza para interactuar con bases de datos MongoDB desde una aplicación Python.| https://pypi.org/project/pymongo/ |
| python-dotenv | 1.0.0 | Es una biblioteca de Python que permite cargar variables de entorno desde un archivo ".env" en una aplicación Python..| https://pypi.org/project/python-dotenv/ |

#### Parametrización de Envios:
En esta sección, podemos cambiar las direcciones IP y los puertos en los que se ejecutan nuestro server, como la instancia de nuestra base de datos Para configurar la parametrización, buscaremos el archivo [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Envios/.env ".env") . Al abrirlo, encontraremos la siguiente información:
```bash
PORTGRPC = 50052
PORTMONGO = 27017
IPMONGO = localhost
```
Como vemos el archivo contiene la definición de las variables necesarias para el microservicio de envíos, el cual incluye:
* PORTGRPC: en que puerto esta corriendo el server gRPC.
* IPMONGO: en que máquina se encuentra la base de datos.
* PORTMONGO: el puerto donde se esta ejecutando en esa máquina.

> Estos parámetros son totalmente modificables.

### Inventario

Este módulo es responsable de proporcionar la comunicación entre la API Gateway y la persistencia de datos en MongoDB, además, se encarga de hacer un CRUD productos simulando un inventario y se encuentra en la carpeta [Inventario](https://github.com/juan9572/TET_Reto_N1/tree/main/Inventario "Inventario").

#### Tecnologías usadas y ejecución de Inventario:
![Java icon](https://img.shields.io/badge/java-%23ED8B00.svg?style=for-the-badge&logo=java&logoColor=white)
![Maven icon](https://img.shields.io/badge/apache_maven-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)
![Mongo icono](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
Este microservicio esta realizado en Java, para poder correrlo deberemos tener instalado [Java JDK](https://www.oracle.com/co/java/technologies/downloads/) en nuestro computador, una vez tengamos Java podremos correr el server de gRPC, pero primero deberemos descargar el manejador de dependencias [Apache Maven](https://maven.apache.org/download.cgi). Cuando este instalado ahora si podremos correr nuestro microservicio.
Para poder ejecutarlo deberemos primero generar los build de maven, para ello iremos a la carpeta de [grpc-interfaces](https://github.com/juan9572/TET_Reto_N1/tree/main/Inventario/grpc-interfaces "grpc-interfaces") y ejecutaremos el siguiente comando en la terminal:
```bash
mvn clean install package
```
 Después a la carpeta de [inventario](https://github.com/juan9572/TET_Reto_N1/tree/main/Inventario/inventario "inventario") y ejecutaremos el mismo comando:
 ```bash
mvn clean install package
```
> Postdata: cuando ejecutemos ambos comandos nos debe salir un mensaje de confirmación indicando que el build se hizo de manera exitosa. ![build exitoso](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/buildMaven.png)

Una vez generado los códigos para poder ejecutar el server gRPC del microservicio de inventario, vamos a la carpeta [inventario](https://github.com/juan9572/TET_Reto_N1/tree/main/Inventario/inventario "inventario") y desde esta ejecutamos el siguiente comando:
 ```bash
mvn org.springframework.boot:spring-boot-maven-plugin:run
```
Cuando corramos este comando deberemos ver algo así en la consola:
![server running inventario](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/InventarioRunning.png)
Ahora nuestro microservicio esta listo y esperando peticiones.
#### Librerías de Inventario:
Las librerías necesarias para poder correr este módulo son:

|Nombre librería| Versión | Propósito | Link |
|--|--|--|--|
| grpc-stub | 1.53.0 | Proporciona las clases necesarias para crear clientes gRPC que puedan invocar a servicios remotos implementados con gRPC. Básicamente, esta dependencia permite generar automáticamente el código del cliente necesario para realizar solicitudes a un servidor que implemente un servicio gRPC.| https://central.sonatype.com/artifact/io.grpc/grpc-stub/1.53.0 |
| grpc-protobuf | 1.53.0 | proporciona las clases necesarias para trabajar con mensajes y servicios definidos en el lenguaje Protocol Buffers. Protocol Buffers es un lenguaje de definición de interfaces desarrollado por Google que permite definir estructuras de datos y servicios de manera independiente del lenguaje de programación utilizado.| https://central.sonatype.com/artifact/io.grpc/grpc-protobuf/1.53.0 |
| mongodb-driver-sync | 4.3.3 | Proporciona una biblioteca cliente para interactuar con una base de datos MongoDB desde una aplicación Java de manera síncrona, es decir, utilizando un modelo de programación bloqueante.| https://central.sonatype.com/artifact/org.mongodb/mongodb-driver-sync/4.9.0 |
| dotenv-java | 2.2.0 | Es una biblioteca que permite cargar y leer variables de entorno desde un archivo `.env` en una aplicación Java.| https://central.sonatype.com/artifact/io.github.cdimascio/dotenv-java/2.3.2 |
#### Parametrización de Inventario:
En esta sección, podemos cambiar las direcciones IP y los puertos en los que se ejecutan nuestro server, como la instancia de nuestra base de datos Para configurar la parametrización, buscaremos el archivo [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Inventario/.env ".env"). Al abrirlo, encontraremos la siguiente información:
```bash
PORTGRPC = 50051
PORTMONGO = 27017
IPMONGO = localhost
```
Como vemos el archivo contiene la definición de las variables necesarias para el microservicio de inventario, el cual incluye:
* PORTGRPC: en que puerto esta corriendo el server gRPC.
* IPMONGO: en que máquina se encuentra la base de datos.
* PORTMONGO: el puerto donde se esta ejecutando en esa máquina.

> Estos parámetros son totalmente modificables.

### Resena

Este módulo es responsable de proporcionar la comunicación entre la API Gateway y la persistencia de datos en MongoDB, además, se encarga de crear reseñas de productos y solo se pueden realizar reseñas si existe una orden de compra del producto y se encuentra en la carpeta [Resena](https://github.com/juan9572/TET_Reto_N1/tree/main/Resena "Resena").

#### Tecnologías usadas y ejecución de Resena:
![Dart icono](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Mongo icono](https://img.shields.io/badge/MongoDB-4EA94B?style=for-the-badge&logo=mongodb&logoColor=white)
Este microservicio esta realizado en Dart, para poder correrlo deberemos tener instalado el [Dart SDK](https://dart.dev/get-dart) en nuestro computador, una vez tengamos Java podremos correr el server de gRPC.
Ahora para ejecutar el server nos vamos a parar en la carpeta [Resena](https://github.com/juan9572/TET_Reto_N1/tree/main/Resena "Resena"), desde aquí ejecutaremos el siguiente comando para instalar las dependencias:
```bash
dart pub get
```
Nos deberá salir un mensaje de confirmación como este:
![pub succes](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/pubDepen.png)
Una vez se instalen, ejecutaremos el siguiente comando para poder ejecutar el server:
```bash
dart bin/server.dart
```
Cuando lo ejecutemos nos tiene que salir algo así en la consola:
![server running reseñas](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/resenaRunning.png)
#### Librerías de Resena:
Las librerías necesarias para poder correr este módulo son:

|Nombre librería| Versión | Propósito | Link |
|--|--|--|--|
| mongo_dart | 0.8.2 | Es una biblioteca cliente para interactuar con una base de datos MongoDB desde una aplicación Dart. Esta biblioteca proporciona un conjunto de clases y métodos que permiten realizar operaciones CRUD (Create, Read, Update, Delete) en una base de datos MongoDB y también soporta características avanzadas como agregaciones y transacciones.| https://pub.dev/packages/mongo_dart |
| dotenv | 4.1.0 | Es una biblioteca que permite cargar y leer variables de entorno desde un archivo `.env` en una aplicación Dart.| https://pub.dev/packages/dotenv |
| async | 2.2.0 | Es una biblioteca que proporciona una serie de herramientas y utilidades para trabajar con programación asíncrona en Dart.| https://api.dart.dev/stable/2.19.2/dart-async/dart-async-library.html |
| grpc | 3.1.0 | Es una biblioteca que permite implementar servicios y clientes de gRPC en Dart.| https://pub.dev/packages/grpc |
| protobuf | 2.0.0 | Es una biblioteca que permite trabajar con el formato de serialización binario Protocol Buffers (también conocido como "protobuf") en Dart.| https://pub.dev/packages/protobuf |
#### Parametrización de Resena:
En esta sección, podemos cambiar las direcciones IP y los puertos en los que se ejecutan nuestro server, como la instancia de nuestra base de datos Para configurar la parametrización, buscaremos el archivo [.env](https://github.com/juan9572/TET_Reto_N1/blob/main/Resena/.env ".env"). Al abrirlo, encontraremos la siguiente información:
```bash
PORTGRPC = 50053
PORTMONGO = 27017
IPMONGO = localhost
```
Como vemos el archivo contiene la definición de las variables necesarias para el microservicio de reseña, el cual incluye:
* PORTGRPC: en que puerto esta corriendo el server gRPC.
* IPMONGO: en que máquina se encuentra la base de datos.
* PORTMONGO: el puerto donde se esta ejecutando en esa máquina.

> Estos parámetros son totalmente modificables.
## Guía de uso
---
Ahora si le pegamos una mirada a la [API_Gateway](https://github.com/juan9572/TET_Reto_N1/tree/main/API_Gateway "API_Gateway"), veremos que podemos realizar ocho tipos de peticiones HTTP REST diferentes. Para ilustrar su funcionamiento, utilizaremos POSTMAN.
Antes de comenzar a mostrar el funcionamiento de cada petición, es importante destacar que se asume que los servidores de los microservicios y el API Gateway ya están en ejecución. En caso contrario, recomendamos revisar la sesión anterior para obtener información sobre cómo poner en marcha estas herramientas. [Descripción técnica de la solución implementada](#descripción-técnica-de-la-solución-implementada), donde se explica como hacer para ejecutar cada server y API.

### Peticiones de microservicio inventario:
#### createProduct:
Función para crear un nuevo producto en el inventario
- Método: **POST**
- Ruta: **/product/create**
- Body:
	```json 
	{
		name: "nombre del producto",
		description: "descripción del producto",
		price: "valor del producto en double",
		stock_quantity: "stock del producto en int",
		seller: "vendedor del producto"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```

##### Ejemplo usando postman
##### request:
![createProductRequest](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/createProduct%20Request.png)
##### response:
![createProductResponse](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/createProduct%20Response.png)
##### db:
![createProduct db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/createProduct%20db.png)
#### readProduct:
Función para consultar los productos creados
- Método: **GET**
- Ruta: **/product/get/:name**
- Body:
	```json 
	{
		name: "nombre del producto"
	}
	```
- Valor de response:
	```json 
	{
		product: {
			name: "nombre del producto",
			description: "descripción del producto",
			price: "valor del producto en double",
			stock_quantity: "stock del producto en int",
			seller: "vendedor del producto"
		}
	}
	```
##### Ejemplo usando postman
##### request:
![getProduct request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/getProduct%20Request.png)
##### response:
![getProduct response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/getProduct%20Response.png)
#### getAllProducts:
Esta función trae todos los productos del servidor y los devuelve en la respuesta
- Método: **GET**
- Ruta: **/product/get/all**
- Body:
	```json 
	{
	}
	```
- Valor de response:
	```json 
	{
		products: [
			{
				name: "nombre del producto",
				description: "descripción del producto",
				price: "valor del producto en double",
				stock_quantity: "stock del producto en int",
				seller: "vendedor del producto"
			}
		]
	}
	```
##### Ejemplo usando postman
##### request:
![getAllProduct request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/getAllProduct%20Request.png)
##### response:
![getAllProduct response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/getAllProduct%20Response.png)
#### updateProduct:
Esta función actualiza los producto
- Método: **PUT**
- Ruta: **/product/update/:name**
- Body:
	```json 
	{
		pastName = "nombre actual del producto"
		name: "nuevo nombre del producto",
		description: "nueva descripción del producto",
		price: "nuevo valor del producto en double",
		stock_quantity: "nuevo stock del producto en int",
		seller: "nuevo vendedor del producto"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```
##### Ejemplo usando postman
##### request:
![updateProduct request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/updateProduct%20Request.png)
##### response:
![updateProduct response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/updateProduct%20Response.png)
##### db:
![updateProduct db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/updateProduct%20db.png)
#### deleteProduct:
 Esta función borra del servidor el producto con el nombre dado
- Método: **DELETE**
- Ruta: **/product/delete/:name**
- Body:
	```json 
	{
		name: "nombre del producto"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```
##### Ejemplo usando postman
##### request:
![deleteProduc request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/deleteProduct%20Request.png)
##### response:
![deleteProduct response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/deleteProduct%20Response.png)
##### db:
![deleteProduct db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/deleteProduct%20db.png)
### Peticiones de microservicio envíos:

#### createOrder:
 Función para crear una orden
- Método: **POST**
- Ruta: **/order/create**
- Body:
	```json 
	{
		statusPurchase: "estado de la orden",
		buyer: "nombre comprador",
		name: "nombre del proucto a comprar",
		address: "dirección de comprador",
		phoneBuyer: "teléfono de comprador",
		cityDelivery: "ciudad de comprador"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```
##### Ejemplo usando postman
##### request:
![orderCreate request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderCreate%20request.png)
##### response:
![orderCreate response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderCreate%20response.png)
##### db:
![orderCreate db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderCreate%20db.png)
#### getOrder:
Función para consultar las ordenes creadas
- Método: **GET**
- Ruta: **/order/get/:name**
- Body:
	```json 
	{
		name: "nombre del proucto"
	}
	```
- Valor de response:
	```json 
	{
		order: {
			statusPurchase: "estado de la orden",
			buyer: "nombre comprador",
			name: "nombre del proucto a comprar",
			address: "dirección de comprador",
			phoneBuyer: "teléfono de comprador",
			cityDelivery: "ciudad de comprador"
		}
	}
	```
##### Ejemplo usando postman
##### request:
![orderGet request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderGet%20Request.png)
##### response:
![orderGet response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderGet%20Response.png)
#### updateOrder:
Función para actualizar la información de las ordenes creadas
- Método: **PUT**
- Ruta: **/order/update/:name**
- Body:
	```json 
	{
		pastName: "nombre actual de orden",
		statusPurchase: "nuevo estado de la orden",
		buyer: "nuevo nombre de comprador",
		name: "nuevo nombre del proucto a comprar",
		address: "nueva dirección de comprador",
		phoneBuyer: "nuevo teléfono de comprador",
		cityDelivery: "nueva ciudad de comprador"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```
##### Ejemplo usando postman
##### request:
![orderUpdate Request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderUpdate%20Request.png)
##### response:
![orderUpdate Response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderUpdate%20Response.png)
##### db:
![orderUpdate db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/orderUpdate%20db.png)

### Peticiones de microservicio reseñas:

#### createReview:
Función para crear una reseña
- Método: **POST**
- Ruta: **/review/create**
- Body:
	```json 
	{
		name: "nombre del producto",
		commentary: "comentario sobre el producto",
		puntuation: "puntuación del producto en int"
	}
	```
- Valor de response:
	```json 
	{
		message: "mensaje de confirmación"
	}
	```
##### Ejemplo usando postman
##### request:
![createReview request](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/reviewCreate%20Request.png)
##### response:
![createReview response](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/reviewCreate%20Response.png)
##### db:
![createReview db](https://raw.githubusercontent.com/juan9572/TET_Reto_N1/main/Img/reviewCreate%20db.png)

## Referencias
---

* [Protocol Buffers Documentation](https://protobuf.dev/)
* [How to Create an API Using gRPC and Node.js](https://nordicapis.com/how-to-create-an-api-using-grpc-and-node-js/)
* [Implementing gRPC In Python: A Step-by-step Guide](https://www.velotio.com/engineering-blog/grpc-implementation-using-python)
* [MongoDB Java Driver](https://www.mongodb.com/docs/drivers/java/sync/current/)
* [MongoDB Driver for Dart and Flutter](https://www.mongodb.com/community/forums/t/mongodb-driver-for-dart-and-flutter/6979)
* [PyMongo 4.3.3 Documentation](https://pymongo.readthedocs.io/en/stable/)
* [Tutorial de gRPC con Spring Boot y Java](https://carlos.faxterol.com/2022/08/tutorial-grpc-spring-boot-java-postman/)
* [Streaming with gRPC in Java](https://www.baeldung.com/java-grpc-streaming)
* [Quick start for Dart](https://grpc.io/docs/languages/dart/quickstart/)
* [Quick start for Python](https://grpc.io/docs/languages/python/quickstart/)
* [Quick start for Java](https://grpc.io/docs/languages/java/quickstart/)
