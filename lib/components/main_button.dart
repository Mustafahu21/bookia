import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.backgroundColor,
    this.height,
    this.width,
    required this.text,
    required this.onPressed,
    this.textStyle,
    this.radius,
  });

  final Color? backgroundColor;
  final double? height;
  final double? width;
  final String text;
  final Function() onPressed;
  final TextStyle? textStyle;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 65),
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 10),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle ?? TextStyles.getBody()),
    );
  }
}
