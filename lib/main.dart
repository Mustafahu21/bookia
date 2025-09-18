import 'package:bookia/core/routes/router.dart';
import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/core/utils/theme.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.value([LocalHelper.init(), DioProvider.init()]);
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
