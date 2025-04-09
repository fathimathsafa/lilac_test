import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class GLTextStyles {
  static TextStyle headline1(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return GoogleFonts.urbanist(
      fontSize: isLargeScreen ? 18.sp : 15.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.white,
    );
  }

  static TextStyle headline2(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return GoogleFonts.urbanist(
      fontSize: isLargeScreen ? 18.sp : 15.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.black,
    );
  }

  static TextStyle buttonText(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return GoogleFonts.urbanist(
      fontSize: isLargeScreen ? 10.sp : 10.sp,
      fontWeight: FontWeight.bold,
      color: ColorTheme.black,
    );
  }

  static TextStyle splashBottomText(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return GoogleFonts.urbanist(
      fontSize: isLargeScreen ? 14.sp : 11.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    );
  }
  static TextStyle screenText(BuildContext context) {
    final isLargeScreen = MediaQuery.of(context).size.width > 600;
    return GoogleFonts.urbanist(
      fontSize: isLargeScreen ? 13.sp : 13.sp,
      color: ColorTheme.grey,
    );
  }
  static robotoStyle({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.roboto(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorTheme.black,
    );
  }

  static cabinStyle({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.cabin(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorTheme.black,
    );
  }

  static manropeStyle(
      {double? size, FontWeight? weight, Color? color, bool isItalic = false}) {
    return GoogleFonts.manrope(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorTheme.black,
      fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
    );
  }

  static interStyle({double? size, FontWeight? weight, Color? color}) {
    return GoogleFonts.inter(
      fontSize: size ?? 22,
      fontWeight: weight ?? FontWeight.bold,
      color: color ?? ColorTheme.black,
    );
  }
}
