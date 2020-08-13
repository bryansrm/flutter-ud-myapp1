import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product page'),
        actions: [
          IconButton( 
            icon: Icon( Icons.image ),
            onPressed: (){},
           ),
          IconButton( 
            icon: Icon( Icons.camera_alt ),
            onPressed: (){},
           ),
        ],
      ),
      body: _contentPage(),
    );
  }

  Widget _contentPage(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          Form(
            child: Column(
              children: [
                _inputProduct(),
                _inputPrice(),
                SizedBox(height: 20.0,),
                _submitButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _inputProduct(){
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product'
      ),
    );
  }

  Widget _inputPrice(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price'
      ),
    );
  }

  Widget _submitButton(){
    return RaisedButton.icon(
      onPressed: (){}, 
      color: globalstyles.primaryColor,
      textColor: Colors.white,
      icon: Icon( Icons.save ), 
      label: Text('Save'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }
}