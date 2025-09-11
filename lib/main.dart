import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/utils/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  await DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.routes,
      debugShowCheckedModeBanner: false,
      theme: Themes.lightTheme,
    );
  }
}
