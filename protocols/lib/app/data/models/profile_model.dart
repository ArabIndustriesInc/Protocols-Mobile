// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  Profile data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        success: json["success"],
        error: json["error"],
        data: Profile.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": data.toJson(),
      };
}

class Profile {
  Profile({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.verified,
    required this.role,
    required this.companyid,
    required this.v,
    required this.address,
    required this.dob,
    required this.fathersname,
    required this.image,
    required this.middlename,
    required this.mobile,
    required this.pannumber,
  });

  String id;
  String firstname;
  String lastname;
  String email;
  String password;
  bool verified;
  String role;
  String companyid;
  int v;
  String address;
  String dob;
  String fathersname;
  String image;
  String middlename;
  String mobile;
  String pannumber;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        verified: json["verified"],
        role: json["role"],
        companyid: json["companyid"],
        v: json["__v"],
        address: json["address"],
        dob: json["dob"],
        fathersname: json["fathersname"],
        image: json["image"],
        middlename: json["middlename"],
        mobile: json["mobile"],
        pannumber: json["pannumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "verified": verified,
        "role": role,
        "companyid": companyid,
        "__v": v,
        "address": address,
        "dob": dob,
        "fathersname": fathersname,
        "image": image,
        "middlename": middlename,
        "mobile": mobile,
        "pannumber": pannumber,
      };
}

class AddProfile {
  AddProfile({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.address,
    required this.dob,
    required this.fathersname,
    required this.image,
    required this.middlename,
    required this.mobile,
    required this.pannumber,
  });

  String id;
  String firstname;
  String lastname;
  String email;
  String address;
  String dob;
  String fathersname;
  String image;
  String middlename;
  String mobile;
  String pannumber;
}
