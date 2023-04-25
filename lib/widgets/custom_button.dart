import 'package:flutter/material.dart';
import 'package:todo/res/text_style.dart';

Widget customButton({
  required String title,
  required Color btnColor,
  required Color titleColor,
  required double width,
   Function()? onTap

}){
  return  GestureDetector(
              onTap: onTap,
              child: Container(
                width: width,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                decoration: BoxDecoration(
                  color: btnColor,
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(title,style: AppTextStyles.heading(titleColor, FontWeight.normal, 14),),
                  ),
              ),
            );
}