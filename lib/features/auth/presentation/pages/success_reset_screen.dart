import 'package:bookia/components/main_button.dart';
import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SuccessResetScreen extends StatelessWidget {
  const SuccessResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    AssetNames.resetpasswordsuccess,
                    width: 100,
                    height: 100,
                  ),
                  Icon(Icons.check_rounded, color: Colors.white, size: 70),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Password Changed!',
                style: TextStyles.getTitle(
                  fontWeight: FontWeight.w400,
                  fontSize: 32,
                ),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Text(
                  'Your password has been changed successfully.',
                  style: TextStyles.getBody(
                    color: AppColors.darkGrey,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              MainButton(
                text: 'Back to Login',
                onPressed: () {
                  pushRemoveUntil(context, Routes.welcome);
                },
                backgroundColor: AppColors.primaryColor,
                textStyle: TextStyles.getBody(color: AppColors.whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
