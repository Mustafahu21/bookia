import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/components/nav_bar_text.dart';
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
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
            showErrorDialog(context, state.error);
          } else {
            showLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                AuthHeader(title: 'Hello! Register to get started'),
                SizedBox(height: 40),
                formFields(),
                SizedBox(height: 40),
                MainButton(
                  text: 'Register',
                  onPressed: () {
                    if (context
                        .read<AuthCubit>()
                        .key
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().register();
                    }
                  },
                  backgroundColor: AppColors.primaryColor,
                  textStyle: TextStyles.getBody(color: AppColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavBarText(
        title1: 'Already have an account? ',
        title2: 'Login Now',
        onTap: () => pushReplacement(context, Routes.login),
      ),
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
              pushReplacement(context, Routes.login);
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

  Form formFields() {
    var cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.key,
      child: Column(
        children: [
          TextFieldInbut(
            hint: 'Username',
            controller: cubit.usernameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Email',
            controller: cubit.emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Password',
            controller: cubit.passwordController,
            obscureText: obscureText,
            validator: (value) {
              if (value!.isEmpty) {
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
          SizedBox(height: 20),
          TextFieldInbut(
            hint: 'Confirm Password',
            controller: cubit.confirmPasswordController,
            obscureText: obscureText,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != cubit.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
