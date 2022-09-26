import 'package:flutter/material.dart';

class AppTextStyle{

  // Bruh
  static TextStyle bigAssText(){
    return const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold
    );
  }

  // Title
  static TextStyle title(){
    return const TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold
    );
  }

  //Header
  static TextStyle header1(){
    return const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle header2(){
    return const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle header3(){
    return const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
    );
  }

  static TextStyle header4(){
    return const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold
    );
  }

  //Normal
  static TextStyle biggerText(){
    return const TextStyle(
        fontSize: 18
    );
  }

  static TextStyle bigText(){
    return const TextStyle(
        fontSize: 16
    );
  }

  static TextStyle normalText(){
    return const TextStyle(
      fontSize: 14
    );
  }

  static TextStyle smallText(){
    return const TextStyle(
        fontSize: 12,
    );
  }

}