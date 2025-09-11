import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/screens/Login/page/login_screen.dart';
import 'package:bookia/features/auth/presentation/screens/Register/register_screen.dart';
import 'package:bookia/features/auth/presentation/screens/forgot_password/pages/forgot_password_screen.dart';
import 'package:bookia/features/auth/presentation/screens/forgot_password/pages/new_password_screen.dart';
import 'package:bookia/features/auth/presentation/screens/forgot_password/pages/otp_screen.dart';
import 'package:bookia/features/auth/presentation/screens/forgot_password/pages/success_reset_screen.dart';
import 'package:bookia/features/home/presentaion/screen/page/home_screen.dart';
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
    ],
  );
}
