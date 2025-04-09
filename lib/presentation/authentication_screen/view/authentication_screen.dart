// phone_number_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
import 'package:lilac_test/presentation/authentication_screen/controller/authentication_screen_controller.dart';
import 'package:lilac_test/presentation/splash_screen/view/splash_screen.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<AuthController>(context);
    final TextEditingController phoneController =
        TextEditingController(text: phoneProvider.phoneNumber);

    return LayoutBuilder(builder: (context, constraints) {
      final isLargeScreen = constraints.maxWidth > 600;

      final double paddingHorizontal = isLargeScreen ? 40.w : 24.w;

      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SplashScreen()));
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorTheme.black,
              )),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    Text("Enter your phone",
                        style: GLTextStyles.headline2(context)),
                    Text("number", style: GLTextStyles.headline2(context)),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  hintText: 'Enter your phone number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  helperStyle: GoogleFonts.urbanist(color: ColorTheme.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: ColorTheme.pink, width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                    "Fliq will send you a text with a verification code.",
                    style: GLTextStyles.screenText(context)),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 48.h,
                child: ElevatedButton(
                  onPressed: () {
                    phoneProvider.onLogin(phoneController.text, context);
                    debugPrint('Phone Number: ${phoneProvider.phoneNumber}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text("Next", style: GLTextStyles.headline1(context)),
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      );
    });
  }
}
