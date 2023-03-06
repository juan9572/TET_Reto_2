import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:dotenv/dotenv.dart';
import 'interface/ReviewService.dart';
import 'package:mongo_dart/mongo_dart.dart';

void main() async {
  // Cargando las variables de entorno desde el archivo .env
  var env = DotEnv(includePlatformEnvironment: true)..load();
  print("--------Estableciendo conexion con DB--------");
  // Creando una instancia de la base de datos y abriendo la conexión
  final db = await Db.create("mongodb://${env["IPMONGO"]}:${env["PORTMONGO"]}/inventario");
  await db.open();
  print("--Conexion OK--");
  print("--------Iniciando servidor gRPC en el puerto ${env["PORTGRPC"]}--------");
  // Creando una instancia del servidor gRPC y pasando la conexión de la base de datos como parámetro
  final server = Server([ReviewService(db)]);
  await server.serve(port: int.parse(env["PORTGRPC"].toString()));
  print("--Escuchando peticiones....--");
  // Esperando una hora antes de finalizar la ejecución del programa, para poder recibir las peticiones (esto es solo un ejemplo, normalmente no se usa)
  await Future.delayed(Duration(hours: 1));
  // Cerrando la conexión con la base de datos
  await db.close();
  print("--------Finalizando servidor gRPC--------");
  print("--------Finalizando conexion a DB--------");
}
