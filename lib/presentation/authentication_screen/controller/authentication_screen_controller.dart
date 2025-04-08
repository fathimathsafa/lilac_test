import 'dart:convert';
import 'dart:developer';
import 'package:another_flushbar/flushbar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/presentation/otp_screen/otp_screen.dart';
import 'package:lilac_test/repository/authentication_screen/service/authentication_screen_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../app_config/app_config.dart';

class AuthController with ChangeNotifier {
  String _phoneNumber = '';

  String get phoneNumber => _phoneNumber;

  void setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  void clear() {
    _phoneNumber = '';
    notifyListeners();
  }

  late SharedPreferences sharedPreferences;

  Future onLogin(String phone, BuildContext context) async {
    log("loginController -> onLogin() started");

    if (phone.isEmpty) {
      Flushbar(
        maxWidth: .55.sw,
        backgroundColor: Colors.grey.shade100,
        messageColor: ColorTheme.black,
        icon: Icon(
          Icons.info,
          color: ColorTheme.red,
          size: 20.sp,
        ),
        message: 'Please fill the field',
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);
      return;
    }

    var data = {
      "data": {
        "type": "registration_otp_codes",
        "attributes": {"phone": phone}
      }
    };

    AuthenticationScreenService.onLogin(data).then((response) {
      if (response["status"] == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => OtpVerificationScreen(phoneNumber: phone)),
          (route) => false,
        );
      } else {
        Flushbar(
          maxWidth: .55.sw,
          backgroundColor: Colors.grey.shade100,
          messageColor: ColorTheme.black,
          icon: Icon(
            Icons.close,
            color: ColorTheme.red,
            size: 20.sp,
          ),
          message: 'Invalid phone number',
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(context);
      }
    });
  }

  void storeLoginData(loginReceivedData) async {
    log("storeLoginData");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(loginReceivedData);
    sharedPreferences.setString(AppConfig.loginData, storeData);
    sharedPreferences.setBool(AppConfig.loggedIn, true);
  }

  void storeUserToken(resData) async {
    log("storeUserToken");
    sharedPreferences = await SharedPreferences.getInstance();
    String dataUser = json.encode(resData);
    sharedPreferences.setString(AppConfig.token, dataUser);
  }
}
