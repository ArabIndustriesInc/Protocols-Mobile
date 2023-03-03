// To parse this JSON data, do
//
//     final investorsModel = votingModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

InvestorsModel investorsModelFromJson(String str) {
  return InvestorsModel.fromJson(json.decode(str));
}

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
    this.registerid,
    required this.role,
    required this.companyid,
    required this.v,
    this.password,
    this.verified,
    this.companyname,
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
  Investors? registerid;
  String role;
  String companyid;
  int v;
  String? password;
  bool? verified;
  String? companyname;

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
        registerid: json["registerid"] == null
            ? null
            : Investors.fromJson(json["registerid"]),
        role: json["role"],
        companyid: json["companyid"],
        v: json["__v"],
        password: json["password"],
        verified: json["verified"],
        companyname: json["companyname"],
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
        "registerid": registerid?.toJson(),
        "role": role,
        "companyid": companyid,
        "__v": v,
        "password": password,
        "verified": verified,
        "companyname": companyname,
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
