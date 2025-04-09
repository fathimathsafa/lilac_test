import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/presentation/authentication_screen/controller/authentication_screen_controller.dart';
import 'package:lilac_test/presentation/authentication_screen/view/phone_number_screen.dart';
import 'package:lilac_test/presentation/chat_screen/controller/chat_controller.dart';
import 'package:lilac_test/presentation/message_list_screen/controller/message_list_screen_controller.dart';
import 'package:lilac_test/presentation/message_list_screen/view/message_list_screen.dart';
import 'package:lilac_test/presentation/otp_screen/controller/otp_screen_controller.dart';
import 'package:lilac_test/presentation/otp_screen/otp_screen.dart';
import 'package:lilac_test/presentation/splash_screen/view/splash_screen.dart';
import 'package:lilac_test/repository/message_list_screen/service/message_list_screen_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        ChangeNotifierProvider(create: (_) => OtpController()),
        ChangeNotifierProvider(create: (_) => MessageListController()),
          ChangeNotifierProvider(create: (_) => ChatController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
