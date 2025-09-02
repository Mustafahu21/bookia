import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/navigators.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/Login/login_screen.dart';
import 'package:bookia/features/Register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetNames.background,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: 120),
                SvgPicture.asset(AssetNames.logo),
                SizedBox(height: 40),
                Text(
                  'Order Your Book Now!',
                  style: TextStyles.getTitle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 200,
            left: 20,
            right: 20,
            child: MainButton(
              text: 'Login',
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                pushTo(context, const LoginScreen());
              },
              textStyle: TextStyles.getBody(color: AppColors.whiteColor),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: MainButton(
              text: 'Register',
              onPressed: () {
                pushTo(context, const RegisterScreen());
              },
            ),
          ),
        ],
      ),
    );
  }
}
