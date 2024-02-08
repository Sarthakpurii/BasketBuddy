import 'package:basketbuddy/screens/form-screen.dart';
import 'package:basketbuddy/screens/home-screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
        primaryColor: const Color(0xFF0F0F0F),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF008170),
          textTheme: ButtonTextTheme.primary,
        ),
        scaffoldBackgroundColor: const Color(0xFF0F0F0F),
        textTheme: const TextTheme().copyWith(
          bodyMedium: const TextStyle(color: Colors.white)
        ),
        // textTheme: const TextTheme(
        //   displayLarge: TextStyle(color: Color(0xFFBE3144)),
        //   bodyLarge: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
        //   // bodyMedium: TextStyle(color: Color(0xFFF05941)),
        //   bodyMedium: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        //   bodySmall: TextStyle(color: Color.fromARGB(255, 240, 95, 73)),
          
        // ),
        iconTheme: const IconThemeData(
          color: Colors.white,
          // color: Color(0xFFBE3144),
        ),
        appBarTheme:const AppBarTheme(
          color: Color(0xFF005B41),
          elevation: 3,
          foregroundColor: Color(0xFF0F0F0F),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFF008170),
        ),
      ),

    home: HomeScreen()
    // home:NewItemScreen()
    ,));
}

