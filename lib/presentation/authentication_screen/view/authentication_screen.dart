// phone_number_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/presentation/authentication_screen/controller/authentication_screen_controller.dart';
import 'package:provider/provider.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneProvider = Provider.of<AuthController>(context);
    final TextEditingController phoneController =
        TextEditingController(text: phoneProvider.phoneNumber);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Enter your phone",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "number",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            // IntlPhoneField(
            //   controller: phoneController,
            //   initialCountryCode: 'IN',
            //   decoration: InputDecoration(
            //     contentPadding:
            //         EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
            //     labelText: 'Phone Number',
            //     border: OutlineInputBorder(
            //       borderRadius: BorderRadius.circular(12.r),
            //     ),
            //   ),
            //   style: TextStyle(fontSize: 16.sp),
            //   onChanged: (value) {
            //     phoneProvider.setPhoneNumber(value.completeNumber);
            //   },
            // ),
            TextField(
              controller: phoneController,
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Text(
                "Fliq will send you a text with a verification code.",
                style: TextStyle(color: Colors.grey.shade600, fontSize: 13.sp),
              ),
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
                  backgroundColor: const Color(0xFFFF4D67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text("Next",
                    style: TextStyle(fontSize: 16.sp, color: Colors.white)),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
