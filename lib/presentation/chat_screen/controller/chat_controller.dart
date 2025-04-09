import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/chat_screen/model/chat_screen_model.dart';
import 'package:lilac_test/repository/chat_screen/service/chat_screen_service.dart';
import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';
import 'package:lilac_test/repository/message_list_screen/service/message_list_screen_service.dart';

class ChatController with ChangeNotifier {
  bool isLoading = false;
  List<ChatModel> chatList = [];

  Future<void> fetchChats(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await ChatService.getChats();

      if (response != null) {
        // Assuming response is already a List<MessageModel>
        // If not, you'll need to properly parse it
        chatList = response;
      } else {
        AppUtils.oneTimeSnackBar(
          "Unable to fetch Data",
          context: context,
          bgColor: ColorTheme.red,
        );
      }
    } catch (e) {
      log("Error in fetchMessages: $e");
      AppUtils.oneTimeSnackBar(
        "Something went wrong",
        context: context,
        bgColor: ColorTheme.red,
      );
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}