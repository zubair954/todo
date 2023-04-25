import 'package:flutter/material.dart';
import 'package:todo/res/colors.dart';

TextFormField customTextField(
  { 
  required TextEditingController ctr,
  required String hint,
  int? maxLines,
  }
){

  OutlineInputBorder border = OutlineInputBorder(borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1,color: AppColors.black));
  return TextFormField(
    controller: ctr,
    maxLines: maxLines ,
    decoration: InputDecoration(
      border: border,
      focusedBorder: border,
      hintText: hint,
      
      ),
    );
  
}