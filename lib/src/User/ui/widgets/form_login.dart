import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {

  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: size.height * .25, right: 30.0, left: 30.0),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 400.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(.4),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3)
                )
              ]
            ),
            child: Text('INGRESO USUARIO')
          ),
          SizedBox(height: 30.0,),
          Text('¿Olvidaste tu contraseña?')
        ],
      ),
    );
  }
}