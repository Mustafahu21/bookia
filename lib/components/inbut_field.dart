import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextFieldInbut extends StatelessWidget {
  const TextFieldInbut({
    super.key,
    required this.hint,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText,
  });

  final String hint;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(20),
        hintText: hint,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
      controller: controller,
      obscureText: obscureText ?? false,
    );
  }
}
