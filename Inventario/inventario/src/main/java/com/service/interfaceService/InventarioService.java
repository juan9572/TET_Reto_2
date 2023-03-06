/**
 * Clase que tiene la implementación de los méotods de gRPC.
 */
package com.service.interfaceService;

import com.google.protobuf.Empty;
import com.inventario.product.interfaces.*;
import com.mongodb.BasicDBObject;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import io.grpc.stub.StreamObserver;
import org.bson.Document;
import org.bson.conversions.Bson;

import static com.mongodb.client.model.Filters.*;
import org.lognet.springboot.grpc.GRpcService;
import java.util.ArrayList;
import java.util.List;

@GRpcService
public class InventarioService extends ProductServiceGrpc.ProductServiceImplBase {
    MongoDatabase database;
    MongoCollection<Document> collection;

    public InventarioService(MongoClient mongoClient){
        // Conexión a la base de datos MongoDB
        database = mongoClient.getDatabase("inventario");
        // Obtención de la colección "products" de la base de datos
        collection = database.getCollection("products");
    }

    // Este método se encarga de crear un nuevo producto y agregarlo a la base de datos
    @Override
    public void createProduct(CreateProductRequest request, StreamObserver<CreateProductResponse> responseObserver){
        System.out.println("--------Realizando peticion de CREATE--------");
        // Creación de un nuevo documento con los datos del producto recibido en la petición
        Document documento = new Document();
        documento.append("name", request.getProduct().getName());
        documento.append("description", request.getProduct().getDescription());
        documento.append("price", request.getProduct().getPrice());
        documento.append("stock_quantity", request.getProduct().getStockQuantity());
        documento.append("seller", request.getProduct().getSeller());
        // Insertar el documento en la colección "products"
        collection.insertOne(documento);
        // Búsqueda del producto recién creado en la colección "products"
        Bson filtro = eq("name", request.getProduct().getName());
        documento = collection.find(filtro).first();
        // Creación de la respuesta con el id asignado por la base de datos al producto creado
        CreateProductResponse response = CreateProductResponse.newBuilder().setMessageOfConfirmation(
               "Se guardo el producto en la DB con el id " + documento.getObjectId("_id").toString() //Se devuelve el id que le asigna la base de datos al producto
        ).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
        System.out.println("--CREATE OK!--");
    }

    // Este método se encarga de actualizar un producto, buscandolo por su nombre y los nuevos datos
    @Override
    public void updateProduct(UpdateProductRequest request, StreamObserver<UpdateProductResponse> responseObserver) {
        System.out.println("--------Realizando peticion de UPDATE--------");
        // Creación de un objeto de consulta para buscar el producto que se quiere actualizar
        Document query = new Document().append("name", request.getName());
        // Creación de un nuevo documento con los datos actualizados del producto
        Document newDocument = new Document();
        if(!request.getProduct().getName().equals(""))
            newDocument.append("name", request.getProduct().getName());
        if(!request.getProduct().getDescription().equals(""))
            newDocument.append("description", request.getProduct().getDescription());
        if(request.getProduct().getPrice() != 0)
            newDocument.append("price", request.getProduct().getPrice());
        if(request.getProduct().getStockQuantity() != 0)
            newDocument.append("stock_quantity", request.getProduct().getStockQuantity());
        if(!request.getProduct().getSeller().equals(""))
            newDocument.append("seller", request.getProduct().getSeller());
        // Creación de un objeto de actualización para aplicar los cambios en la colección "products"
        BasicDBObject update = new BasicDBObject();
        update.put("$set", newDocument);
        // Actualización del documento en la colección "products" que coincide con el objeto de consulta
        collection.updateOne(query, update);
        // Creación de la respuesta con el mensaje de confirmación indicando que se actualizo el producto
        UpdateProductResponse response = UpdateProductResponse.newBuilder().setMessageOfConfirmation(
                "Se actualizo el producto " + request.getName() + " correctamente"
        ).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
        System.out.println("--UPDATE OK!--");
    }

    // Este método se encarga de eliminar un producto de la base de datos dado su nombre
    @Override
    public void deleteProduct(DeleteProductRequest request, StreamObserver<DeleteProductResponse> responseObserver) {
        System.out.println("--------Realizando peticion de DELETE--------");
        // Se crea un filtro para buscar el producto que se desea eliminar en la colección "products"
        Bson filtro = eq("name", request.getName());
        // Se elimina el documento que coincide con el filtro de la colección "products"
        collection.deleteOne(filtro);
        // Se crea la respuesta con el mensaje de confirmación de que el producto se eliminó correctamente
        DeleteProductResponse response = DeleteProductResponse.newBuilder().setMessageOfConfirmation(
                "Se borro el producto " + request.getName() + " de la DB correctamente"
        ).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
        System.out.println("--DELETE OK!--");
    }

    // Este método se encarga de obtener todos los productos de la base de datos
    @Override
    public void getAllProducts(Empty request, StreamObserver<GetAllResponse> responseObserver) {
        System.out.println("--------Realizando peticion de GET--------");
        // Se crea una lista vacía para almacenar los productos
        List<Product> allProducts = new ArrayList<>();
        // Se obtiene un cursor para recorrer los documentos de la colección "products"
        MongoCursor<Document> cursor = collection.find().iterator();
        try {
            // Se obtiene el siguiente documento
            while(cursor.hasNext()){
                Document doc = cursor.next();
                // Se crea un objeto Product a partir de los datos del documento
                Product product = Product.newBuilder().
                        setName(doc.getString("name")).
                        setDescription(doc.getString("description")).
                        setPrice(doc.getDouble("price")).
                        setStockQuantity(doc.getInteger("stock_quantity")).
                        setSeller(doc.getString("seller")).build();
                // Se agrega el producto a la lista
                allProducts.add(product);
            }
        }finally {
            cursor.close();
        }
        // Se crea la respuesta con la lista de productos obtenidos
        GetAllResponse response = GetAllResponse.newBuilder().addAllProduct(allProducts).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
        System.out.println("--GET OK!--");
    }

    // Este método se encarga de obtener un producto de la base de datos dado su nombre
    @Override
    public void readProduct(ReadProductRequest request, StreamObserver<ReadProductResponse> responseObserver) {
        System.out.println("--------Realizando peticion de READ: "+ request.getName() +"--------");
        // Se crea un filtro para buscar el producto en la colección "products"
        Bson filtro = eq("name", request.getName());
        // Se busca el documento que coincide con el filtro en la colección "products"
        Document doc = collection.find(filtro).first();
        // Se crea un objeto Product a partir de los datos del documento
        Product product = Product.newBuilder().
                setName(doc.getString("name")).
                setDescription(doc.getString("description")).
                setPrice(doc.getDouble("price")).
                setStockQuantity(doc.getInteger("stock_quantity")).
                setSeller(doc.getString("seller")).build();
        // Se crea la respuesta con el producto encontrado
        ReadProductResponse response = ReadProductResponse.newBuilder().setProduct(product).build();
        responseObserver.onNext(response);
        responseObserver.onCompleted();
        System.out.println("--READ OK!--");
    }
}
