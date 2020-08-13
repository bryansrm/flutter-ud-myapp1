import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;
import 'package:app_udemy_1/src/Util/validations.dart' as validations;

class ProductPage extends StatelessWidget {

  final formKey = GlobalKey<FormState>();

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
            key: formKey,
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
      validator: ( value ){

        if( value.isEmpty ){
          return 'The price is required';
        }

        if( validations.isNumeric(value) ){
          return  null;
        } else {
          return 'You must type only numbers';
        }
      },
    );
  }

  Widget _submitButton(){
    return RaisedButton.icon(
      onPressed: () => _submitFunction(), 
      color: globalstyles.primaryColor,
      textColor: Colors.white,
      icon: Icon( Icons.save ), 
      label: Text('Save'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0)
      ),
    );
  }

  void _submitFunction(){
    if( !formKey.currentState.validate() ) return null;
    print('avanzar');
  }
}