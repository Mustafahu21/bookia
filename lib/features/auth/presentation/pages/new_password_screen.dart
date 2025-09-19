import 'package:bookia/components/app_bar_arrow.dart';
import 'package:bookia/components/inbut_field.dart';
import 'package:bookia/components/main_button.dart';
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

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key, required this.otp});

  final String otp;
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: AppBarArrow(), leadingWidth: 70),
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            pushTo(context, Routes.successReset);
          } else if (state is AuthFailure) {
            pop(context);
            showErrorDialog(context, state.error);
          } else {
            showLoadingDialog(context);
          }
        },
        child: SingleChildScrollView(child: form(context)),
      ),
    );
  }

  Form form(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    cubit.otpController.text = widget.otp;
    return Form(
      key: cubit.key,
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            header(),
            SizedBox(height: 40),
            fields(),
            SizedBox(height: 40),
            MainButton(
              text: 'Reset Password',
              onPressed: () {
                if (cubit.key.currentState!.validate()) {
                  cubit.newPassword();
                }
              },
              backgroundColor: AppColors.primaryColor,
              textStyle: TextStyles.getBody(color: AppColors.whiteColor),
            ),
          ],
        ),
      ),
    );
  }

  Column fields() {
    var cubit = context.read<AuthCubit>();
    return Column(
      children: [
        TextFieldInbut(
          hint: 'New Password',
          controller: cubit.passwordController,
          obscureText: passwordVisible,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
            child: Transform.scale(
              scale: 1.3,
              child: SvgPicture.asset(
                AssetNames.passwordEye,
                fit: BoxFit.none,
                colorFilter: ColorFilter.mode(
                  AppColors.lightGrayColor,
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
          obscureText: true,
        ),
      ],
    );
  }

  Column header() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [AuthHeader(title: 'Create new password')],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Text(
                'Your new password must be unique from those previously used.',
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
