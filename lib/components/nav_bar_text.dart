import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class NavBarText extends StatelessWidget {
  const NavBarText({
    super.key,
    required this.title1,
    required this.title2,
    required this.onTap,
  });

  final String title1;
  final String title2;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title1, style: TextStyles.getBody(color: AppColors.darkGrey)),
          GestureDetector(
            onTap: onTap,
            child: Text(
              title2,
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
}
