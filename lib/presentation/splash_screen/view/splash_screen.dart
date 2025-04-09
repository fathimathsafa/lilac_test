import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lilac_test/core/constants/colors.dart';
import 'package:lilac_test/core/constants/text_styles.dart';
import 'package:lilac_test/presentation/authentication_screen/view/authentication_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isLargeScreen = constraints.maxWidth > 600;

        final double logoHeight = isLargeScreen ? 60.h : 60.h;
        final double buttonFontSize = isLargeScreen ? 14.sp : 12.sp;

        final double buttonHeight = 48.h;
        final double paddingHorizontal = isLargeScreen ? 40.w : 24.w;
        final double spacing = 12.h;

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
                    padding:
                        EdgeInsets.symmetric(horizontal: paddingHorizontal),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20.h),
                        Center(
                          child: Image.asset(
                            'assets/logo.png',
                            height: logoHeight,
                          ),
                        ),
                        SizedBox(height: spacing),
                        Text('Connect. Meet. Love.\nWith Fliq Dating',
                            textAlign: TextAlign.center,
                            style: GLTextStyles.headline1(context)),
                        SizedBox(height: 400.h),
                        SignInButton(
                          leadingWidget: Image.asset(
                            'assets/googlelogo.png',
                            height: buttonFontSize + 3.sp,
                          ),
                          text: 'Sign in with Google',
                          color: ColorTheme.white,
                          textColor: ColorTheme.black,
                          fontSize: buttonFontSize,
                          height: buttonHeight,
                          onPressed: () {},
                        ),
                        SizedBox(height: spacing),
                        SignInButton(
                          leadingWidget: Icon(
                            Icons.facebook,
                            color: ColorTheme.white,
                          ),
                          text: 'Sign in with Facebook',
                          color: ColorTheme.blue,
                          textColor: ColorTheme.white,
                          fontSize: buttonFontSize,
                          height: buttonHeight,
                          onPressed: () {},
                        ),
                        SizedBox(height: spacing),
                        SignInButton(
                          leadingWidget: Icon(
                            Icons.phone,
                            color: Colors.white,
                          ),
                          text: 'Sign in with phone number',
                          color: ColorTheme.pink,
                          textColor: Colors.white,
                          fontSize: buttonFontSize,
                          height: buttonHeight,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneNumberScreen()));
                          },
                        ),
                        SizedBox(height: spacing * 2),
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
                        SizedBox(height: spacing * 2.5),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
      icon: leadingWidget,
      label: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: textColor),
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
