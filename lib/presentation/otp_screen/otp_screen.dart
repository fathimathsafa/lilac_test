import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
import 'package:lilac_test/presentation/otp_screen/controller/otp_screen_controller.dart';
import 'package:pinput/pinput.dart';
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
    Provider.of<OtpController>(context, listen: false)
        .setPhoneNumber("+91${widget.phoneNumber}");
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: const TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade400),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
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
              style: GLTextStyles.headline2(context).copyWith(fontSize: 18.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              "+91 ${widget.phoneNumber} Edit",
              style: GoogleFonts.urbanist(
                fontSize: 10.sp,
                color: ColorTheme.grey,
              ),
            ),
            SizedBox(height: 30.h),
            Pinput(
              length: 6,
              //controller: _otpController,
              defaultPinTheme: defaultPinTheme,
              onCompleted: (String verificationCode) {
                debugPrint("OTP entered: $verificationCode");
                setState(() {
                  _enteredOtp = verificationCode;
                });
              },
            ),

            
            SizedBox(height: 24.h),
            Text(
              "Didn't get anything? No worries, let's try again.",
              style: GLTextStyles.screenText(context),
              textAlign: TextAlign.center,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Resend",
                style: GoogleFonts.urbanist(
                  color: ColorTheme.pink,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
            const Spacer(),
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
                      const SnackBar(
                          content: Text("Please enter a 6-digit OTP")),
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
                  style: GLTextStyles.headline1(context),
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
