import 'dart:convert';

import 'package:http/http.dart' as http;


import 'package:app_udemy_1/src/models/producto_model.dart';

class ProductosProvider {

  final String _url = 'https://flutter-platzi-trips.firebaseio.com';

  Future<bool> createProduct( ProductoModel product ) async {
    final url = '$_url/ud_products.json';

    final resp = await http.post(url, body: productoModelToJson(product));
    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<List<ProductoModel>> loadListProducts() async {

    final url = '$_url/ud_products.json';

    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);

    if( decodedData == null ) return [];

    List<ProductoModel> listProducts = [];
    decodedData.forEach( (id, product) {
      final objProduct = ProductoModel.fromJson(product);
      objProduct.id = id;

      listProducts.add(objProduct);
    });

    return listProducts;
  }

  Future<bool> updateProduct( ProductoModel product ) async {
    final url = '$_url/ud_products/${product.id}.json';

    final resp = await http.put(url, body: productoModelToJson(product));

    // print(decodedData);

    return true;

  }

  Future<bool> deleteProduct(String id) async {
    final url = '$_url/ud_products/$id.json';

    final resp = await http.delete(url);

    print(resp.body);
    return true;
  }

}