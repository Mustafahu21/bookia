import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/components/nav_bar_text.dart';
import 'package:bookia/components/social_media_icon.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            pushRemoveUntil(context, Routes.home);
          } else if (state is AuthFailure) {
            pop(context);
            showMyDialog(context, state.error, DialogType.error);
          } else {
            showLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                AuthHeader(title: 'Welcome back! Glad to see you, Again!'),
                SizedBox(height: 40),
                formFields(),
                forgotPassword(context),
                Column(
                  children: [
                    SizedBox(height: 25),
                    MainButton(
                      text: 'Login',
                      onPressed: () {
                        if (context
                            .read<AuthCubit>()
                            .key
                            .currentState!
                            .validate()) {
                          context.read<AuthCubit>().login();
                        }
                      },
                      backgroundColor: AppColors.primaryColor,
                      textStyle: TextStyles.getBody(
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
                divider(),
                SizedBox(height: 30),
                socialMedia(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBarText(
        title1: 'Don\'t have an account? ',
        title2: 'Register Now',
        onTap: () => pushReplacement(context, Routes.register),
      ),
    );
  }

  Row forgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            pushTo(context, Routes.forgotPassword);
          },
          child: Text(
            'Forgot Password?',
            style: TextStyles.getBody(color: AppColors.darkGrey),
          ),
        ),
      ],
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

  Form formFields() {
    var cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          TextFieldInbut(
            hint: 'Enter Your Email',
            controller: cubit.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Enter Your Password',
            controller: cubit.passwordController,
            obscureText: obscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
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
