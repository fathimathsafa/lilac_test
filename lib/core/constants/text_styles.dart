import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class GLTextStyles {
  static TextStyle headline1(BuildContext context) {
   
    return GoogleFonts.urbanist(
      fontSize:  15.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.white,
    );
  }

  static TextStyle headline2(BuildContext context) {
    
    return GoogleFonts.urbanist(
      fontSize:  15.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.black,
    );
  }

  static TextStyle buttonText(BuildContext context) {
   
    return GoogleFonts.urbanist(
      fontSize:  10.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.black,
    );
  }

  static TextStyle splashBottomText(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize:11.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    );
  }

  static TextStyle screenText(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize:13.sp,
      color: ColorTheme.grey,
    );
  }

 static TextStyle utilsText(BuildContext context) {
    return GoogleFonts.urbanist(
      fontSize:12.sp,
      color: ColorTheme.white,
    );
  }



  




}
