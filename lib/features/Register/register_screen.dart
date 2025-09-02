import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/navigators.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/Login/login_screen.dart';
import 'package:bookia/features/Login/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var key = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
              AuthHeader(title: 'Hello! Register to get started'),
              FormFields(),
              SizedBox(height: 40),
              MainButton(
                text: 'Register',
                onPressed: () {},
                backgroundColor: AppColors.primaryColor,
                textStyle: TextStyles.getBody(color: AppColors.whiteColor),
              ),
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
            "Already have an account? ",
            style: TextStyles.getBody(color: AppColors.darkGrey),
          ),
          GestureDetector(
            onTap: () {
              pushReplacement(context, LoginScreen());
            },
            child: Text(
              'Login Now',
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

  Form FormFields() {
    return Form(
      key: key,
      child: Column(
        children: [
          TextFieldInbut(hint: 'Username', controller: usernameController),
          SizedBox(height: 20),
          TextFieldInbut(hint: 'Email', controller: emailController),
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Password',
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
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Confirm Password',
            controller: confirmPasswordController,
            obscureText: obscureText,
          ),
        ],
      ),
    );
  }
}
