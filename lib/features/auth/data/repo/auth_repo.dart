import 'dart:developer';

import 'package:bookia/core/services/api/dio_provider.dart';
import 'package:bookia/core/services/api/endpoints.dart';
import 'package:bookia/core/services/local/local_helper.dart';
import 'package:bookia/features/auth/data/model/request/auth_params.dart';
import 'package:bookia/features/auth/data/model/response/auth_response/auth_response.dart';
import 'package:bookia/features/auth/data/model/response/otp_send_and_check/otp_send_and_check.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        var data = AuthResponse.fromJson(res.data);
        LocalHelper.setUserData(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var data = AuthResponse.fromJson(res.data);
        LocalHelper.setUserData(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OtpSendAndCheck?> forgotPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.forgotPassword,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        return OtpSendAndCheck.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OtpSendAndCheck?> checkForgotPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.checkForgotPassword,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        return OtpSendAndCheck.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> resetPassword(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: Endpoints.changePassword,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        return AuthResponse.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<OtpSendAndCheck?> resendCode(AuthParams params) async {
    try {
      var res = await DioProvider.get(
        endpoint:
            '${Endpoints.resendCode}?email=${params.email}', // Add email as query param
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );

      log('Resend response: ${res.data}');

      if (res.statusCode == 200) {
        return OtpSendAndCheck.fromJson(res.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log('Resend error: ${e.toString()}');
      return null;
    }
  }
}
