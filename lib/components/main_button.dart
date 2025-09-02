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
  });

  final Color? backgroundColor;
  final double? height;
  final double? width;
  final String text;
  final Function() onPressed;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity, height ?? 65),
        backgroundColor: backgroundColor ?? AppColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle ?? TextStyles.getBody()),
    );
  }
}
