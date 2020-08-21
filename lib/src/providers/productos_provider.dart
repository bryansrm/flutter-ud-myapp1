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

    print(decodedData);

    return [];

  }

}