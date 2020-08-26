import 'package:app_udemy_1/src/Producto/ui/pages/product_page.dart';
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

         final products = snapshot.data;
         print('lenght ${products.length}');

         return ListView.builder(
           physics: BouncingScrollPhysics(),
           itemCount: products.length,
           itemBuilder: (context, index) => _createItem( context, products[index] ),
         );
       } else {
         return CircularProgressIndicator();
       }
      },
    );

  }

  Widget _createItem(BuildContext context, ProductoModel product){
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red[300],
      ),
      onDismissed: (direction) {
        productosProvider.deleteProduct(product.id);
      },
      child: Card(
        child: Column(
          children: [

            Container(
              height: 250,
              width: double.infinity,
              child: product.fotoUrl != null
                ? FadeInImage(
                  image: NetworkImage(product.fotoUrl),
                  placeholder: AssetImage('assets/jar-loading.gif'),
                  fit: BoxFit.cover,
                )
                : Image( 
                    image: AssetImage('assets/no-image.png'),
                    fit: BoxFit.cover,
                  ),
            ),

            ListTile(
              title: Text(
                product.titulo
              ),
              subtitle: Text(product.valor.toString()),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductPage(product: product,))),
            ),

          ],
        ),
      )
    );

    
  }
}