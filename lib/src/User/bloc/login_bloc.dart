

import 'dart:async';

import 'package:app_udemy_1/src/User/bloc/validators.dart';

class LoginBloc with Validators {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // Insertar valores al strem
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Get info
  Stream<String> get emailStream => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform( validatePassword );

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }

}