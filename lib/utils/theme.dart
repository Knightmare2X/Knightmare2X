import 'package:flutter/material.dart';

class MyThemes{
   static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(),
      primaryColor: Colors.white,

   );


   static final lightTheme = ThemeData(
       scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      primaryColor: Colors.black,
   );
}