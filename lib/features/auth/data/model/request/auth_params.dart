class AuthParams {
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? otp;
  String? newPassword;
  String? newPasswordConfirmation;

  AuthParams({
    this.email,
    this.password,
    this.confirmPassword,
    this.name,
    this.otp,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": confirmPassword,
      "verify_code": int.parse(otp ?? "0"),
      "new_password": newPassword,
      "new_password_confirmation": newPasswordConfirmation,
    };
  }
}
