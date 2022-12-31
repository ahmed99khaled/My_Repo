import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/view/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName='splash screen';

  @override
  Widget build(BuildContext context) {
    Timer((Duration(seconds:3)), ()
    {
      Navigator.pushReplacementNamed(context,HomeScreen.routeName);
    });
    return Stack(
      children: [
        Container(
          color:Colors.white,
          width:double.infinity,
          height:double.infinity,
          child:Image.asset('assets/images/pattern.png',fit: BoxFit.fill,),

        ),
        Center(child: Image.asset('assets/images/logo.png',)),
      ],
    );
  }
}
