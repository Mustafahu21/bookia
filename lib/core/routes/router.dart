import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/pages/login_screen.dart';
import 'package:bookia/features/auth/presentation/pages/register_screen.dart';
import 'package:bookia/features/auth/presentation/pages/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/pages/new_password_screen.dart';
import 'package:bookia/features/auth/presentation/pages/otp_screen.dart';
import 'package:bookia/features/auth/presentation/pages/success_reset_screen.dart';
import 'package:bookia/features/home/presentaion/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentaion/page/all_products_screen.dart';
import 'package:bookia/features/home/presentaion/page/home_screen.dart';
import 'package:bookia/features/main/main_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';
  static const String newPassword = '/new-password';
  static const String successReset = '/success-reset';
  static const String home = '/home';
  static const String main = '/main';
  static const String allProducts = '/all-products';

  static final routes = GoRouter(
    routes: [
      GoRoute(path: splash, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(
        path: forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgotPasswordScreen(),
        ),
      ),
      GoRoute(
        path: otp,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: OtpScreen(email: state.extra as String),
        ),
      ),
      GoRoute(
        path: newPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: NewPasswordScreen(otp: state.extra as String),
        ),
      ),
      GoRoute(
        path: successReset,
        builder: (context, state) => SuccessResetScreen(),
      ),
      GoRoute(path: home, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: main,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit()
            ..bestSellers()
            ..sliderPics(),
          child: MainAppScreen(),
        ),
      ),
      GoRoute(
        path: allProducts,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit()..allProducts(),
          child: AllProductsScreen(),
        ),
      ),
    ],
  );
}
