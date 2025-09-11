import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
import 'package:bookia/components/nav_bar_text.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/screens/Login/widgets/auth_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final key = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            pushTo(
              context,
              Routes.otp,
              extra: context.read<AuthCubit>().emailController.text,
            );
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
                header(),
                SizedBox(height: 40),
                emailForm(),
                SizedBox(height: 40),
                MainButton(
                  text: 'Send Code',
                  onPressed: () {
                    if (context
                        .read<AuthCubit>()
                        .key
                        .currentState!
                        .validate()) {
                      context.read<AuthCubit>().forgotPassword();
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
        title1: 'Remember password? ',
        title2: 'Login',
        onTap: () => pop(context),
      ),
    );
  }

  Form emailForm() {
    var cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.key,
      child: TextFieldInbut(
        hint: 'Enter Your Email',
        controller: cubit.emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        },
      ),
    );
  }

  Column header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [AuthHeader(title: 'Forgot Password?')],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                'Don\'t worry! It occurs. Please enter the email address linked with your account.',
                style: TextStyles.getBody(
                  color: AppColors.darkGrey,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
