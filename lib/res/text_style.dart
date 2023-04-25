import 'package:flutter/material.dart';

class AppTextStyles{

  static TextStyle heading(Color color, FontWeight fontWeight,double size  ){
    return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight
    );
  }

}