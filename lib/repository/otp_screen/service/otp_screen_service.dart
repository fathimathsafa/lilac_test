import 'dart:developer';
import 'package:japx/japx.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/api_helper/api_helper.dart';

class OtpService {
  static Future<dynamic> verifyOtp(Map<String, dynamic> data) async {
    try {
      var rawResponse = await ApiHelper.postData(
        endPoint: "/auth/registration-otp-codes/actions/phone/verify-otp",
        header: ApiHelper.getApiHeader(access: "117|KfuqqNXivj5Kztyf8cqwU11XJXlpmraS0mayLqu58a3bf708"),
        body: data,
      );

      // ✅ Decode using japx to handle JSON:API
      final japxDecoded = Japx.decode(rawResponse);
      log("Decoded Response: $japxDecoded");
      return japxDecoded;
    } catch (e) {
      log("Error in verifyOtp: $e");
      return null;
    }
  }
}
