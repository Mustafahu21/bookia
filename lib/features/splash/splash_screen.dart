import 'package:bookia/core/constants/asset_names.dart';
import 'package:bookia/core/routes/navigators.dart';
import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      var value = LocalHelper.getUserData();
      if (value != null) {
        pushReplacement(context, Routes.main);
      } else {
        pushReplacement(context, Routes.welcome);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetNames.logo),
              SizedBox(height: 20),
              Text(
                'Order Your Book Now!',
                style: TextStyles.getTitle(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
