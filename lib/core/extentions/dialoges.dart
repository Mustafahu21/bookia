import 'package:bookia/core/constants/asset_names.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showErrorDialog(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.red,
      content: Text(message),
    ),
  );
}

showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Lottie.asset(AssetNames.loading, height: 200, width: 200)],
      ),
    ),
  );
}

Widget getLoadingWidget() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Lottie.asset(AssetNames.loading, height: 200, width: 200)],
    ),
  );
}
