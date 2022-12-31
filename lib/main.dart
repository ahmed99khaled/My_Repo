import 'package:flutter/material.dart';
import 'package:news_app/core/style/mytheme.dart';
import 'package:news_app/view/home_screen.dart';
import 'package:news_app/view/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      theme:MyTheme.lightTheme,
      routes:{
        HomeScreen.routeName:(context) => HomeScreen(),
        SplashScreen.routeName:(context) => SplashScreen(),
      },
      initialRoute:SplashScreen.routeName,
    );
  }

}