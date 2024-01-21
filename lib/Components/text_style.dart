import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled4/Components/colors.dart';

class CustomTextStyle {
  static TextStyle textStyle1 = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle2 = TextStyle(
    color: AppColors.red,
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textStyle3 = TextStyle(
      fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle4 = TextStyle(
      fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle5 = TextStyle(
      fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle textStyle6 = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textStyle7 = TextStyle(
    color: Colors.white,
    fontSize: 20.sp,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.normal,
    fontFamily: 'Roboto',

  );
  static TextStyle textStyle8 = TextStyle(
    color: Colors.white,
    fontSize: 15.sp,
    fontWeight: FontWeight.normal,
    fontStyle: FontStyle.italic,
    fontFamily:   'Roboto',

  );
}
