// To parse this JSON data, do
//
//     final investorsModel = investorsModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

InvestorsModel investorsModelFromJson(String str) =>
    InvestorsModel.fromJson(json.decode(str));

String investorsModelToJson(InvestorsModel data) => json.encode(data.toJson());

class InvestorsModel {
  InvestorsModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Investors> data;

  factory InvestorsModel.fromJson(Map<String, dynamic> json) => InvestorsModel(
        success: json["success"],
        error: json["error"],
        data: List<Investors>.from(
            json["data"].map((x) => Investors.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Investors {
  Investors({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.email,
    required this.mobile,
    required this.dob,
    required this.pannumber,
    required this.fathersname,
    required this.address,
    required this.image,
    required this.registerid,
    required this.role,
    required this.v,
  });

  String id;
  String firstname;
  String lastname;
  String middlename;
  String email;
  String mobile;
  String dob;
  String pannumber;
  String fathersname;
  String address;
  String image;
  String registerid;
  String role;
  int v;

  factory Investors.fromJson(Map<String, dynamic> json) => Investors(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        middlename: json["middlename"],
        email: json["email"],
        mobile: json["mobile"],
        dob: json["dob"],
        pannumber: json["pannumber"],
        fathersname: json["fathersname"],
        address: json["address"],
        image: json["image"],
        registerid: json["registerid"],
        role: json["role"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "middlename": middlename,
        "email": email,
        "mobile": mobile,
        "dob": dob,
        "pannumber": pannumber,
        "fathersname": fathersname,
        "address": address,
        "image": image,
        "registerid": registerid,
        "role": role,
        "__v": v,
      };
}

class AddInvestors {
  AddInvestors({
    required this.firstname,
    required this.lastname,
    required this.middlename,
    required this.email,
    required this.mobile,
    required this.dob,
    required this.pannumber,
    required this.fathersname,
    required this.address,
    required this.image,
  });

  String firstname;
  String lastname;
  String middlename;
  String email;
  String mobile;
  String dob;
  String pannumber;
  String fathersname;
  String address;
  File image;
}
