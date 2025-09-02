import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon({super.key, this.iconPath});

  final String? iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lightGrayColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(iconPath ?? ''),
      ),
    );
  }
}
