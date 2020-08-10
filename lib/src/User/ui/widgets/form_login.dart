import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/User/bloc/provider.dart';

class FormLogin extends StatelessWidget {

  Size size;
  LoginBloc bloc;

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of(context);
    size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: size.height * .12, right: 30.0, left: 30.0),
        child: Column(
          children: [
            _pinUser(),
            _boxForm(),
            SizedBox(height: 30.0,),
            Text('¿Olvidaste tu contraseña?'),
            SizedBox(height: 30.0,),
          ],
        ),
      ),
    );
  }

  Widget _pinUser(){
    return Container(
      margin: EdgeInsets.only(bottom: 30.0),
      child: Column(
        children: [
          Icon( Icons.person_pin_circle, color: Colors.white, size: 80.0,),
          Text('Bryan Rodríguez', style: TextStyle(color: Colors.white, fontSize: 30.0),)
        ],
      ),
    );
  }

  // Widget loginForm(){
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         _boxForm(),
  //         SizedBox(height: 30.0,),
  //         Text('¿Olvidaste tu contraseña?'),
  //         SizedBox(height: 30.0,),
  //       ],
  //     ),
  //   );
  // }

  Widget _boxForm(){
    return Container(
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
      child: Container(
        margin: EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('INGRESO' , style: TextStyle(fontSize: 20.0, color: Colors.deepPurple, fontWeight: FontWeight.bold),),
             SizedBox(height: 30.0,),
            _createEmail(),
            SizedBox(height: 30.0,),
            _createPassword(),
             SizedBox(height: 30.0,),
             _loginButton()
          ],
        ),
      )
    );
  }

  Widget _createEmail(){
    return StreamBuilder(
      stream: bloc.emailStream,
      builder: ( _, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon( Icons.alternate_email, color: Colors.deepPurple ),
              hintText: 'ejemplo@correo.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changeEmail
          ),
        );
      },
    );
  }

  Widget _createPassword(){
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: ( _, AsyncSnapshot snapshot){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon( Icons.lock_outline, color: Colors.deepPurple ),
              labelText: 'Contraseña',
              counterText: snapshot.data,
              errorText: snapshot.error
            ),
            onChanged: bloc.changePassword,
          ),
        );
    });
    
  }

  Widget _loginButton(){
    return StreamBuilder(
      stream: bloc.formValidStream,
      builder: ( _, AsyncSnapshot snapshot){
        return RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric( horizontal: 80.0, vertical: 15.0),
            child: Text('Ingresar'),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)
          ),
          elevation: 0.0,
          color: Colors.deepPurple,
          textColor: Colors.white,
          onPressed: snapshot.hasData ? () {
              print('boton open');
          } : null
        );
      },
    );
    
  }
}