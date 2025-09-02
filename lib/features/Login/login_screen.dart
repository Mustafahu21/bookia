import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/components/social_media_icon.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/navigators.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/Login/widgets/auth_header.dart';
import 'package:bookia/features/Register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var key = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              AuthHeader(title: 'Welcome back! Glad to see you, Again!'),
              formFields(),
              loginButton(),
              divider(),
              SizedBox(height: 30),
              socialMedia(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBarText(context),
    );
  }

  SafeArea navBarText(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyles.getBody(color: AppColors.darkGrey),
          ),
          GestureDetector(
            onTap: () {
              pushReplacement(context, RegisterScreen());
            },
            child: Text(
              'Register Now',
              style: TextStyles.getBody(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row socialMedia() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SocialMediaIcon(iconPath: AssetNames.google)),
        SizedBox(width: 10),
        Expanded(child: SocialMediaIcon(iconPath: AssetNames.facebook)),
        SizedBox(width: 10),
        Expanded(child: SocialMediaIcon(iconPath: AssetNames.apple)),
      ],
    );
  }

  Row divider() {
    return Row(
      children: [
        Expanded(
          child: Divider(color: AppColors.lightGrayColor, thickness: 0.7),
        ),
        SizedBox(width: 15),
        Text(
          'Or Login With',
          style: TextStyles.getBody(color: AppColors.darkGrey),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Divider(color: AppColors.lightGrayColor, thickness: 0.7),
        ),
      ],
    );
  }

  Column loginButton() {
    return Column(
      children: [
        SizedBox(height: 65),
        MainButton(
          text: 'Login',
          onPressed: () {},
          backgroundColor: AppColors.primaryColor,
          textStyle: TextStyles.getBody(color: AppColors.whiteColor),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Form formFields() {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFieldInbut(hint: 'Enter Your Email', controller: emailController),
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Enter Your Password',
            controller: passwordController,
            obscureText: obscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Transform.scale(
                scale: 1.3,
                child: SvgPicture.asset(
                  AssetNames.passwordEye,
                  fit: BoxFit.none,
                  colorFilter: ColorFilter.mode(
                    obscureText
                        ? AppColors.lightGrayColor
                        : AppColors.darkColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
