import 'package:flutter/material.dart';

class MyTheme{
  static Color primaryLight=Colors.green;
  static Color whiteColor=Colors.white;
  static Color blackColor=Colors.black;
  static Color redColor=const Color(0xFFC91C22);
  static Color blueColor=const Color(0xFF003E90);
  static Color pinkColor=const Color(0xFFED1E79);
  static Color brownColor=const Color(0xFFCF7E48);
  static Color babyBlueColor=const Color(0xFF4882CF);
  static Color yellowColor=const Color(0xFFF2D352);


  static ThemeData lightTheme=ThemeData(
    primaryColor:primaryLight,
    scaffoldBackgroundColor:Colors.transparent,
    appBarTheme:AppBarTheme(
      elevation:0,
      backgroundColor:primaryLight
    ),
    textTheme:TextTheme(
      headline1:TextStyle(
          fontSize: 22, fontWeight: FontWeight.w500, color: whiteColor),
      headline2: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: blackColor),
      headline3: TextStyle(
          fontSize: 17, fontWeight: FontWeight.bold, color: blackColor),
    ),

  );
}