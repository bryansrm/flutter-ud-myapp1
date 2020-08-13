import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product page'),
        actions: [
          Icon( Icons.image ),
          Icon( Icons.camera_alt )
        ],
      ),
      body: _contentPage(),
    );
  }

  Widget _contentPage(){
    return Center(
      child: Column(
        children: [
          Text( 'PRODUCT PAGE' )
          // _inputProduct(),
          // _inputPrice(),
        ],
      ),
    );
  }
}