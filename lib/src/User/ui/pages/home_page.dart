import 'package:flutter/material.dart';

import 'package:app_udemy_1/src/Util/global_styles.dart' as globalstyles;

import 'package:app_udemy_1/src/User/bloc/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME PAGE'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('email: ${bloc.email}'),
            Text('password: ${bloc.password}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: globalstyles.primaryColor,
        child: Icon( Icons.add),
        onPressed: () => Navigator.pushNamed(context, 'product'),
      ),
    );
  }
}