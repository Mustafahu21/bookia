import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/nav_bar_text.dart';
import 'package:bookia/core/extentions/dialoges.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bookia/features/auth/presentation/widgets/auth_header.dart';
import 'package:bookia/features/auth/presentation/widgets/pinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    // var cubit = context.read<AuthCubit>();
    // cubit.emailController.text = email;
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            pushTo(
              context,
              Routes.newPassword,
              extra: context.read<AuthCubit>().otpController.text,
            );
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
            child: Column(children: [header(), SizedBox(height: 40), OtpPin()]),
          ),
        ),
      ),
      bottomNavigationBar: NavBarText(
        title1: 'Didn\'t receive code? ',
        title2: 'Resend',
        onTap: () {
          var cubit = context.read<AuthCubit>();
          cubit.emailController.text = email; // Add this line to set the email
          cubit.resendCode();
        },
      ),
    );
  }

  Column header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [AuthHeader(title: 'OTP Verification')],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                'Enter the verification code we just sent on your email address.',
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
