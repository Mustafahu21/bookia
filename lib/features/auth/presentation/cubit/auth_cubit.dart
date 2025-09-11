import 'package:bookia/features/auth/data/model/request/auth_params.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  var key = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final otpController = TextEditingController();

  login() async {
    emit(AuthLoading());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );
    var response = await AuthRepo.login(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Login failed"));
    }
  }

  register() async {
    emit(AuthLoading());

    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      name: usernameController.text,
    );
    var response = await AuthRepo.register(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Registration failed"));
    }
  }

  forgotPassword() async {
    emit(AuthLoading());

    var params = AuthParams(email: emailController.text);
    var response = await AuthRepo.forgotPassword(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Password reset failed"));
    }
  }

  checkForgotPassword() async {
    emit(AuthLoading());

    var params = AuthParams(
      email: emailController.text,
      otp: otpController.text,
    );
    var response = await AuthRepo.checkForgotPassword(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Password reset failed"));
    }
  }

  newPassword() async {
    emit(AuthLoading());

    var params = AuthParams(
      otp: otpController.text,
      newPassword: passwordController.text,
      newPasswordConfirmation: confirmPasswordController.text,
    );
    print('Reset Password Params: ${params.toJson()}');

    var response = await AuthRepo.resetPassword(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Password reset failed"));
    }
  }

  resendCode() async {
    emit(AuthLoading());

    var params = AuthParams(email: emailController.text);
    var response = await AuthRepo.resendCode(params);
    if (response != null) {
      emit(AuthSuccess());
    } else {
      emit(AuthFailure("Failed to resend code"));
    }
  }
}
