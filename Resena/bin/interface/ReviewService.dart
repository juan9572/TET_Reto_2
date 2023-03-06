import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:mongo_dart/mongo_dart.dart';
import '../generated/interface/reviews.pb.dart';
import '../generated/interface/reviews.pbgrpc.dart';

class ReviewService extends ReviewServiceBase {
  // Declara una variable database de tipo Db (definido en la librería mongo_dart)
  // como "late" (es decir, que se inicializará después)
  late final Db database;

  ReviewService(database){
    this.database = database;
  }

  @override
  Future<CreateReviewResponse> createReview(
      ServiceCall call, CreateReviewRequest request) async {
    // Método para crear una reseña
    print("--------Realizando peticion de CREATE--------");
    final collection = database.collection('reviews'); // Colección de resenas
    final result = await collection.insertOne({ // Insertar la reseña en la colección
      "nameBuyer":request.review.nameBuyer,
      "nameProduct":request.review.nameProduct,
      "commentary":request.review.commentary,
      "puntuation":request.review.puntuation
    });
    final response = CreateReviewResponse() // Mensaje de confirmación
      ..messageOfConfirmation = "Se guardo el producto en la DB con el id  ${result.id}";
    print("--CREATE OK!--");
    return response;
  }
}
