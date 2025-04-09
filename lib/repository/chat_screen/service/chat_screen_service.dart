import 'dart:convert';
import 'dart:developer';
import 'package:japx/japx.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/api_helper/api_helper.dart';
import 'package:lilac_test/repository/chat_screen/model/chat_screen_model.dart';

class ChatService {
  static Future<List<ChatModel>?> getChats() async {
    try {
      final rawResponse = await ApiHelper.getData(
        endPoint: "/chat/chat-messages/queries/chat-between-users/55/81",
        header: ApiHelper.getApiHeader(
            access: "117|KfuqqNXivj5Kztyf8cqwU11XJXlpmraS0mayLqu58a3bf708"),
      );

      if (rawResponse != null) {
        // Log the raw response for debugging
        log("Raw response: $rawResponse");

        // Return the whole structure for proper handling in the controller
        return chatModelFromJson(jsonEncode(rawResponse["data"]));
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