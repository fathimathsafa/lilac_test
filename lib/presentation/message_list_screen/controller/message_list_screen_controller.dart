import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/utils/app_utils.dart';
import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';
import 'package:lilac_test/repository/message_list_screen/service/message_list_screen_service.dart';

class MessageListController with ChangeNotifier {
  bool isLoading = false;
  List<MessageModel> messageList = [];

  Future<void> fetchMessages(BuildContext context) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await MessageListService.getContactUsers();

      if (response != null) {
        
        messageList = response;
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

