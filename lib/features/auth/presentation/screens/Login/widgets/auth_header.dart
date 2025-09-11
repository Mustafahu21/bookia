import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          title,
          style: TextStyles.getTitle(fontSize: 32, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
