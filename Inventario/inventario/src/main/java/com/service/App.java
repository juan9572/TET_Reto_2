/**
 * Clase principal que inicia el servidor gRPC y establece conexión con una base de datos MongoDB.
 */
package com.service;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.service.interfaceService.InventarioService;
import io.github.cdimascio.dotenv.Dotenv;
import io.grpc.Server;
import io.grpc.ServerBuilder;

import java.io.IOException;

public class App
{
    public static void main( String[] args ) throws IOException, InterruptedException {
        // Carga las variables de entorno desde el archivo .env
        Dotenv dotenv = Dotenv.configure().load();
        // Obtiene el número de puerto para el servidor gRPC desde las variables de entorno
        int port = Integer.parseInt(dotenv.get("PORTGRPC"));
        // Establece la conexión con la base de datos MongoDB utilizando las variables de entorno
        System.out.println("--------Estableciendo conexion con DB--------");
        MongoClient mongoClient = MongoClients.create(
                "mongodb://" + dotenv.get("IPMONGO") + ":" + dotenv.get("PORTMONGO")
        );
        System.out.println("--Conexion OK--");
        // Inicia el servidor gRPC y añade el servicio de inventario con la conexión a la base de datos
        System.out.println("--------Iniciando servidor gRPC en el puerto " + port +"--------");
        Server server = ServerBuilder.forPort(port).addService(new InventarioService(mongoClient)).build();
        server.start();
        // Espera por peticiones
        System.out.println("--Escuchando peticiones....--");
        server.awaitTermination();
        // Cierra la conexión a la base de datos al finalizar el servidor gRPC
        System.out.println("--------Finalizando servidor gRPC--------");
        mongoClient.close();
        System.out.println("--------Finalizando conexion a DB--------");
    }
}
