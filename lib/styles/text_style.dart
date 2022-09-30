import 'package:flutter/material.dart';

class AppTextStyle{

  final BuildContext context;

  AppTextStyle(this.context);

  AppTextStyle.of(this.context);
  
  final baseHeight = 844.0; //844

  // Bruh
  TextStyle bigAssText(){
    return TextStyle(
        fontSize: MediaQuery.of(context).size.height*(40/baseHeight),
        fontWeight: FontWeight.bold
    );
  }

  // Title
  TextStyle title(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(28/baseHeight),
      fontWeight: FontWeight.bold
    );
  }

  //Header
  TextStyle header1(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(24/baseHeight),
      fontWeight: FontWeight.bold
    );
  }

  TextStyle header2(){
    return TextStyle(
        fontSize: MediaQuery.of(context).size.height*(20/baseHeight),
        fontWeight: FontWeight.bold
    );
  }

  TextStyle header3(){
    return TextStyle(
        fontSize: MediaQuery.of(context).size.height*(18/baseHeight),
        fontWeight: FontWeight.bold
    );
  }

  TextStyle header4(){
    return TextStyle(
        fontSize: MediaQuery.of(context).size.height*(16/baseHeight),
        fontWeight: FontWeight.bold
    );
  }

  //Normal
  TextStyle biggerText(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(18/baseHeight),
    );
  }

  TextStyle bigText(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(16/baseHeight),
    );
  }

  TextStyle normalText(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(14/baseHeight),
    );
  }

  TextStyle smallText(){
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height*(12/baseHeight),
    );
  }

  TextStyle borderRadiusButtonLabelStyle(Color labelColor){
    return TextStyle(
        fontSize: MediaQuery.of(context).size.height*(20/baseHeight),
        color: labelColor,
        fontWeight: FontWeight.bold
    );
  }
}