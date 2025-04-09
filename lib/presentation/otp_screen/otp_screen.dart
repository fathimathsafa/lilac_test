import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
import 'package:lilac_test/presentation/otp_screen/controller/otp_screen_controller.dart';
import 'package:provider/provider.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String _enteredOtp = "";

  @override
  void initState() {
    super.initState();
    // Optionally set phone number to controller here
    Provider.of<OtpController>(context, listen: false)
        .setPhoneNumber("+91${widget.phoneNumber}");
  }

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
            Text(
              "Enter your verification code",
              style: GLTextStyles.headline2(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              " ${widget.phoneNumber} Edit",
              style:
                  GoogleFonts.urbanist(fontSize: 10.sp, color: ColorTheme.grey),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 30.h),

            /// OTP Text Field within LayoutBuilder for dynamic width calculation.
            
            

                 OtpTextField(
                  numberOfFields: 6,
                  borderColor: ColorTheme.grey,
                  focusedBorderColor: ColorTheme.pink,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(10.r),
                  onCodeChanged: (String code) {
                    // Update state if needed
                  },
                  onSubmit: (String verificationCode) {
                    debugPrint("OTP entered: $verificationCode");
                    setState(() {
                      _enteredOtp = verificationCode;
                    });
                  },
                ),
              
            

            SizedBox(height: 24.h),

            Text(
              "Didn't get anything? No worries, let's try again.",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {
                // Handle OTP resend logic
              },
              child: Text(
                "Resent", // Consider 'Resend' if appropriate.
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
                  if (_enteredOtp.length == 6) {
                    Provider.of<OtpController>(context, listen: false)
                        .verifyOtp(_enteredOtp, widget.phoneNumber, context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter a 6-digit OTP")),
                    );
                  }
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
