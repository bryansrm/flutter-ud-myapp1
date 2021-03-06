import 'package:flutter/material.dart';


import 'package:app_udemy_1/src/User/ui/pages/login_page.dart';
import 'package:app_udemy_1/src/User/ui/pages/home_page.dart';
import 'package:app_udemy_1/src/Producto/ui/pages/product_page.dart';
 
import 'package:app_udemy_1/src/User/bloc/provider.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.deepPurple),
        title: 'Material App',
        initialRoute: 'home',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage(),
          'product': (BuildContext context) => ProductPage(),
        },
      ),
    );

  }
}