import 'dart:convert';
import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/app_config/app_config.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/presentation/message_list_screen/view/message_list_screen.dart';
import 'package:lilac_test/repository/authentication_screen/service/authentication_screen_service.dart';
import 'package:lilac_test/repository/otp_screen/service/otp_screen_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController with ChangeNotifier {
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

  Future verifyOtp(String otp, String phone, BuildContext context) async {
    log("OtpController -> verifyOtp() started");

    var data = {
      "data": {
        "type": "registration_otp_codes",
        "attributes": {
          "phone": phone,
          "otp": int.parse(otp),
          "device_meta": {
            "type": "web",
            "name": "HP Pavilion 14-EP0068TU",
            "os": "Linux x86_64",
            "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
            "browser_version": "112.0.2",
            "user_agent":
                "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
            "screen_resolution": "1600x900",
            "language": "en-GB"
          }
        }
      }
    };

    final response = await OtpService.verifyOtp(data);

    if (response != null && response['data'] != null) {
    

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => MessagesScreen()),
        (route) => false,
      );

      Flushbar(
        maxWidth: .45.sw,
        backgroundColor: Colors.grey.shade100,
        messageColor: ColorTheme.black,
        icon: Icon(Icons.done, color: ColorTheme.green, size: 20.sp),
        message: 'Login successful',
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);
    } else {
      Flushbar(
        maxWidth: .55.sw,
        backgroundColor: Colors.grey.shade100,
        messageColor: ColorTheme.black,
        icon: Icon(Icons.close, color: ColorTheme.red, size: 20.sp),
        message: 'Invalid OTP or phone number',
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(context);
    }
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
