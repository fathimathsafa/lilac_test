import 'dart:convert';
import 'dart:developer';
import 'package:japx/japx.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/api_helper/api_helper.dart';
import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';

class MessageListService {
  static Future<List<MessageModel>?> getContactUsers() async {
    try {
      final rawResponse = await ApiHelper.getData(
        endPoint: "/chat/chat-messages/queries/contact-users",
        header: ApiHelper.getApiHeader(
            access: "117|KfuqqNXivj5Kztyf8cqwU11XJXlpmraS0mayLqu58a3bf708"),
      );

      if (rawResponse != null) {
        // Log the raw response for debugging
        log("Raw response: $rawResponse");

        // Return the whole structure for proper handling in the controller
        return messageModelFromJson(jsonEncode(rawResponse["data"]));
      } else {
        log("getContactUsers: Response is null");
        return null;
      }
    } catch (e) {
      log("getContactUsers error: $e");
      return null;
    }
  }
}
