import 'package:app_udemy_1/src/User/ui/widgets/form_login.dart';
import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/User/ui/widgets/background_login.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          LoginBackground(),
          FormLogin()
        ],
      )
    );
  }
}