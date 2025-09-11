import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

class OtpPin extends StatefulWidget {
  const OtpPin({super.key});

  @override
  State<OtpPin> createState() => _OtpPinState();
}

class _OtpPinState extends State<OtpPin> {
  var focusNode = FocusNode();
  var formKey = GlobalKey<FormState>();
  String? message;

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = AppColors.primaryColor;
    const fillColor = AppColors.fieldGrayColor;
    const borderColor = AppColors.lightGrayColor;

    final defaultPinTheme = PinTheme(
      width: 80,
      height: 70,
      textStyle: TextStyles.getTitle(color: AppColors.darkColor, fontSize: 26),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    var cubit = context.read<AuthCubit>();
    return Form(
      key: cubit.key,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              length: 6,
              enableInteractiveSelection: true,
              controller: cubit.otpController,
              focusNode: focusNode,
              defaultPinTheme: defaultPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 5),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter OTP';
                }
                return null;
              },
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 22,
                    height: 1,
                    color: focusedBorderColor,
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: focusedBorderColor, width: 1.5),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: fillColor,
                  border: Border.all(color: focusedBorderColor, width: 1.5),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: Colors.redAccent, width: 1.5),
              ),
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(message!, style: TextStyles.getBody(color: Colors.red)),
              ],
            ),
          ],
          SizedBox(height: 40),
          MainButton(
            text: 'Submit',
            backgroundColor: AppColors.primaryColor,
            textStyle: TextStyles.getBody(color: AppColors.whiteColor),
            onPressed: () {
              focusNode.unfocus();
              if (cubit.key.currentState!.validate()) {
                cubit.checkForgotPassword();
              }
            },
          ),
        ],
      ),
    );
  }
}
