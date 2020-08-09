import 'package:flutter/material.dart';

class LoginBackground extends StatelessWidget {

  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    
    return _background();
  }

  Widget _background(){
    return Stack(
      children: [
        Container(
          height: size.height * .4,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(63, 63, 156, 1.0),
                Color.fromRGBO(90, 70, 178, 1.0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            )
          ),
        ),
        Positioned( top: 60.0, left: 10.0,  child: _circles() ),
        Positioned( top: -30.0, right: -20.0,  child: _circles() ),
        Positioned( top: 180.0, left: 130.0,  child: _circles() ),
        Positioned( bottom: -60.0, right: 0.0,  child: _circles() ),
        
      ],
    );
  }

  Widget _circles(){
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Colors.white.withOpacity(.1)
      ),
    );
  }

}