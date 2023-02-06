// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.success,
    required this.error,
    required this.message,
    required this.registerid,
    required this.email,
    required this.companyname,
    required this.role,
    required this.firstname,
    required this.lastname,
    required this.token,
    required this.expiresIn,
    required this.paid,
  });

  bool success;
  bool error;
  String message;
  String registerid;
  String email;
  String companyname;
  String role;
  String firstname;
  String lastname;
  String token;
  String expiresIn;
  bool paid;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        registerid: json["registerid"],
        email: json["email"],
        companyname: json["companyname"],
        role: json["role"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        token: json["token"],
        expiresIn: json["expiresIn"],
        paid: json["paid"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "registerid": registerid,
        "email": email,
        "companyname": companyname,
        "role": role,
        "firstname": firstname,
        "lastname": lastname,
        "token": token,
        "expiresIn": expiresIn,
        "paid": paid,
      };
}
