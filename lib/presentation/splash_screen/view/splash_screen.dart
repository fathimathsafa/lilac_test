import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                Image.asset(
                  'assets/logo.png',
                  height: 60.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  'Connect. Meet. Love.\nWith Fliq Dating',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                SignInButton(
                  icon: Icons.g_mobiledata,
                  text: 'Sign in with Google',
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(height: 10.h),
                SignInButton(
                  icon: Icons.facebook,
                  text: 'Sign in with Facebook',
                  color: const Color(0xFF1877F2),
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: 10.h),
                SignInButton(
                  icon: Icons.phone,
                  text: 'Sign in with phone number',
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  onPressed: () {},
                ),
                SizedBox(height: 20.h),
                Text.rich(
                  TextSpan(
                    text: 'By signing up, you agree to our ',
                    style: TextStyle(color: Colors.white70, fontSize: 11.sp),
                    children: [
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      TextSpan(text: '. See how we use your data in our '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const SignInButton({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, color: textColor, size: 20.sp),
      label: Text(
        text,
        style: TextStyle(fontSize: 14.sp, color: textColor),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(double.infinity, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
