import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),

            /// Title
            Text(
              "Enter your verification code",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            /// Phone number display
            Text(
              "+91 $phoneNumber",
              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 30.h),

            /// OTP Field
            OtpTextField(
              numberOfFields: 6,
              borderColor: Colors.grey.shade400,
              focusedBorderColor: const Color(0xFFFF4D67),
              showFieldAsBox: true,
              fieldWidth: 45.w,
              borderRadius: BorderRadius.circular(10.r),
              onCodeChanged: (String code) {
                // Do something with code on change
              },
              onSubmit: (String verificationCode) {
                debugPrint("OTP entered: $verificationCode");
                // Handle OTP submit logic
              },
            ),

            SizedBox(height: 24.h),

            /// Hint text
            Text(
              "Didn't get anything? No worries, let's try again.",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),

            /// Resend button
            TextButton(
              onPressed: () {
                // Handle OTP resend logic
              },
              child: Text(
                "Resent",
                style: TextStyle(
                  color: const Color(0xFFFF4D67),
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),

            const Spacer(),

            /// Verify Button
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  // Final verification logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF4D67),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text(
                  "Verify",
                  style: TextStyle(fontSize: 16.sp, color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
