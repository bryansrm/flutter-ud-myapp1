

import 'dart:async';

class Validators {

  static int _minLengthPassword = 6;

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: ( password, sink){
      if( password.length >= _minLengthPassword ){
        sink.add(password);
      } else{
        sink.addError('La contraseña no puede ser menor a ${_minLengthPassword.toString()} dígitos');
      }
    }
  );

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: ( email, sink){
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp(pattern);

      if( regExp.hasMatch(email) ){
        sink.add(email);
      } else{
        sink.addError('Email no tiene el formato correcto');
      }
    }
  );
}