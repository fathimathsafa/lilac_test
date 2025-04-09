// // user_profile_controller.dart


// class UserProfileController extends GetxController {
//   final UserProfileService _userProfileService = UserProfileService();
  
//   final RxBool isLoading = true.obs;
//   final Rx<List<Customer>> userProfiles = Rx<List<Customer>>([]);
//   final RxString error = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUserProfiles();
//   }

//   Future<void> fetchUserProfiles() async {
//     try {
//       isLoading.value = true;
//       final response = await _userProfileService.getUserProfiles();
//       userProfiles.value = response.data;
//       isLoading.value = false;
//     } catch (e) {
//       error.value = e.toString();
//       isLoading.value = false;
//     }
//   }

//   // Refresh user profiles
//   Future<void> refreshUserProfiles() async {
//     error.value = '';
//     await fetchUserProfiles();
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:lilac_test/core/constants/colors.dart';
// // import 'package:lilac_test/core/utils/app_utils.dart';
// // import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';
// // import 'package:lilac_test/repository/message_list_screen/service/message_list_screen_service.dart';

// // class MessageListController with ChangeNotifier {
// //   bool isLoading = false;
// //   MessageModel messageModel = MessageModel();

// //   fetchMessages( context) async {
// //     isLoading = true;
// //     notifyListeners();
// //     MessageListService.getContactUsers().then((response) {
// //       if (response != null) {
// //         messageModel = MessageModel.fromJson(response);
// //         isLoading = false;
// //       } else {
// //         AppUtils.oneTimeSnackBar("Unable to fetch Data",
// //             context: context, bgColor: ColorTheme.red);
// //       }
// //       notifyListeners();
// //     });
// //   }
// // }
