import 'dart:developer';

import 'package:flutter/src/widgets/framework.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/api_helper/api_helper.dart';

class AuthenticationScreenService {
    static Future<dynamic> onLogin(Map<String, dynamic> data) async {
    try {
      var decodedData = await ApiHelper.postData(
          endPoint:
              "/auth/registration-otp-codes/actions/phone/send-otp",
          header: ApiHelper.getApiHeader(access: await AppUtils.getToken()),
          body: data);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}