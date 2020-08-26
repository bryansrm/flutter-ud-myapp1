import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;
import 'package:app_udemy_1/src/Util/validations.dart' as validations;
import 'package:app_udemy_1/src/models/producto_model.dart';
import 'package:app_udemy_1/src/providers/productos_provider.dart';

class ProductPage extends StatefulWidget {

  final ProductoModel product;

  const ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ProductoModel producto = new ProductoModel();
  ProductosProvider productosProvider = new ProductosProvider();
  File photo;


  @override
  Widget build(BuildContext context) {

    if( widget.product != null ){
      producto = widget.product;
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Product page'),
        actions: [
          IconButton( 
            icon: Icon( Icons.image ),
            onPressed: () => _processPhoto(ImageSource.gallery),
           ),
          IconButton( 
            icon: Icon( Icons.camera_alt ),
            onPressed: () => _processPhoto(ImageSource.camera),
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
                _showPhoto(),
                _inputProduct(),
                _inputPrice(),
                _createAvailable(),
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
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Product'
      ),
      onSaved: (value) => producto.titulo = value,
    );
  }

  Widget _inputPrice(){
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Price'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
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

  Widget _createAvailable(){
    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      onChanged: ( value ) {
        setState(() {
          producto.disponible = value;
        });
      },
    );
  }

  void _submitFunction() async {
    if( !formKey.currentState.validate() ) return null;

    formKey.currentState.save();
    print('avanzar');
    print(producto.titulo);
    print(producto.valor);

    if( photo != null ) {
      producto.fotoUrl = await loadImage(photo);
    }

    if( widget.product != null ){
      productosProvider.updateProduct(producto);
    } else {
       productosProvider.createProduct(producto);
    }

    _showSnackbar('Se aguardo con éxito');

  }

  void _showSnackbar(String message){
    final snackbar = SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 2000),
    );

    scaffoldKey.currentState.showSnackBar( snackbar );
  }

  Widget _showPhoto() {
    if( producto.fotoUrl != null ) {
      
      return FadeInImage(
        image: NetworkImage(producto.fotoUrl),
        placeholder: AssetImage('assets/jar-loading.gif'),
        height: 300,
        width: double.infinity,
        fit: BoxFit.cover,
      );

    } else {

      return Image(
        image: AssetImage( photo?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );

    }
  }

  _processPhoto(ImageSource source) async {
    final _picker = ImagePicker();

    final pickedFile = await _picker.getImage(
      source: source
    );

    photo = File(pickedFile.path);

    if(photo != null){
      producto.fotoUrl = null;
   }

    setState(() { }); 
  }

  Future<String> loadImage(File image) async {
    final url = Uri.parse('https://api.cloudinary.com/v1_1/digjflsj9/image/upload?upload_preset=wt7w1iot');
    final mimeType = mime(image.path).split('/');

    final imageUploadRequest = http.MultipartRequest('POST', url);

    final file = await http.MultipartFile.fromPath('file', image.path, contentType: MediaType( mimeType[0], mimeType[1] ));

    imageUploadRequest.files.add(file);

    final streamResponse = await imageUploadRequest.send();

    final resp = await http.Response.fromStream(streamResponse);

    if( resp.statusCode != 200 && resp.statusCode != 201 ){
      print('ocurrio un error');
      print(resp.body);
      return null;
    }

    final respData = json.decode(resp.body);
    print(respData);

    return respData['secure_url'];
    
  }
    
  
}