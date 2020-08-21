import 'package:flutter/material.dart';


import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;

import 'package:app_udemy_1/src/providers/productos_provider.dart';
import 'package:app_udemy_1/src/models/producto_model.dart';
import 'package:app_udemy_1/src/User/bloc/provider.dart';

class HomePage extends StatelessWidget {

  final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      body: _loadDataProducts(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: globalstyles.primaryColor,
        child: Icon( Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'product'),
      ),
    );
  }

  Widget _loadDataProducts(){

    return FutureBuilder(
      future: productosProvider.loadListProducts(),
      builder: ( _, AsyncSnapshot<List<ProductoModel>> snapshot ){
       if( snapshot.hasData ){
         return Container();
       } else {
         return CircularProgressIndicator();
       }
      },
    );

  }
}