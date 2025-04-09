import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
import 'package:lilac_test/presentation/authentication_screen/view/authentication_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/couplepic.png',
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.h),
                    Center(
                      child: Image.asset(
                        'assets/logo.png',
                        height: 60.h,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'Connect. Meet. Love.\nWith Fliq Dating',
                      textAlign: TextAlign.center,
                      style: GLTextStyles.headline1(context),
                    ),
                    SizedBox(height: 400.h),
                    SignInButton(
                      leadingWidget: Image.asset(
                        'assets/googlelogo.png',
                        height: 15.sp,
                      ),
                      text: 'Sign in with Google',
                      color: ColorTheme.white,
                      textColor: ColorTheme.black,
                      fontSize: 14.sp,
                      height: 48.h,
                      onPressed: () {},
                    ),
                    SizedBox(height: 12.h),
                    SignInButton(
                      leadingWidget: Icon(
                        Icons.facebook,
                        color: ColorTheme.white,
                      ),
                      text: 'Sign in with Facebook',
                      color: ColorTheme.blue,
                      textColor: ColorTheme.white,
                      fontSize: 14.sp,
                      height: 48.h,
                      onPressed: () {},
                    ),
                    SizedBox(height: 12.h),
                    SignInButton(
                      leadingWidget: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      text: 'Sign in with phone number',
                      color: ColorTheme.pink,
                      textColor: Colors.white,
                      fontSize: 14.sp,
                      height: 48.h,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PhoneNumberScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 24.h),
                    Text.rich(
                      TextSpan(
                        text: 'By signing up, you agree to our ',
                        style: GLTextStyles.splashBottomText(context),
                        children: [
                          TextSpan(
                            text: 'Terms',
                            style: GLTextStyles.splashBottomText(context),
                          ),
                          const TextSpan(
                              text: '. See how we use your data in our '),
                          TextSpan(
                            text: 'Privacy Policy',
                            style: GLTextStyles.splashBottomText(context),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final Widget leadingWidget;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final double fontSize;
  final double height;

  const SignInButton({
    super.key,
    required this.leadingWidget,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
    required this.fontSize,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Flexible(child: leadingWidget),
      label: Flexible(
        child: Text(
          text,
          style: TextStyle(fontSize: fontSize, color: textColor),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, height),
        shape: const StadiumBorder(),
      ),
      onPressed: onPressed,
    );
  }
}
