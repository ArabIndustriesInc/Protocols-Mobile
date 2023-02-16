import 'dart:convert';
import 'dart:io';

DirectorsModel directorsModelFromJson(String str) =>
    DirectorsModel.fromJson(json.decode(str));

String directorsModelToJson(DirectorsModel data) => json.encode(data.toJson());

class DirectorsModel {
  bool? success;
  bool? error;
  List<Directors>? data;

  DirectorsModel({this.success, this.error, this.data});

  DirectorsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    if (json['data'] != null) {
      data = <Directors>[];
      json['data'].forEach((v) {
        data?.add(Directors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Directors {
  String? id;
  String? firstname;
  String? lastname;
  String? middlename;
  String? email;
  String? mobile;
  String? dob;
  String? pannumber;
  String? fathersname;
  String? address;
  String? image;
  Registerid? registerid;
  String? companyname;
  String? role;
  int? iV;

  Directors(
      {this.id,
      this.firstname,
      this.lastname,
      this.middlename,
      this.email,
      this.mobile,
      this.dob,
      this.pannumber,
      this.fathersname,
      this.address,
      this.image,
      this.registerid,
      this.companyname,
      this.role,
      this.iV});

  Directors.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    middlename = json['middlename'];
    email = json['email'];
    mobile = json['mobile'];
    dob = json['dob'];
    pannumber = json['pannumber'];
    fathersname = json['fathersname'];
    address = json['address'];
    image = json['image'];
    registerid = json['registerid'] != null
        ? Registerid?.fromJson(json['registerid'])
        : null;
    companyname = json['companyname'];
    role = json['role'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['middlename'] = middlename;
    data['email'] = email;
    data['mobile'] = mobile;
    data['dob'] = dob;
    data['pannumber'] = pannumber;
    data['fathersname'] = fathersname;
    data['address'] = address;
    data['image'] = image;
    if (registerid != null) {
      data['registerid'] = registerid?.toJson();
    }
    data['companyname'] = companyname;
    data['role'] = role;
    data['__v'] = iV;
    return data;
  }
}

class Registerid {
  String? id;
  String? email;
  String? password;
  bool? verified;
  String? companyname;
  String? role;
  int? iV;
  String? address;
  String? dob;
  String? fathersname;
  String? firstname;
  String? image;
  String? lastname;
  String? middlename;
  String? pannumber;
  String? mobile;

  Registerid(
      {this.id,
      this.email,
      this.password,
      this.verified,
      this.companyname,
      this.role,
      this.iV,
      this.address,
      this.dob,
      this.fathersname,
      this.firstname,
      this.image,
      this.lastname,
      this.middlename,
      this.pannumber,
      this.mobile});

  Registerid.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    email = json['email'];
    password = json['password'];
    verified = json['verified'];
    companyname = json['companyname'];
    role = json['role'];
    iV = json['__v'];
    address = json['address'];
    dob = json['dob'];
    fathersname = json['fathersname'];
    firstname = json['firstname'];
    image = json['image'];
    lastname = json['lastname'];
    middlename = json['middlename'];
    pannumber = json['pannumber'];
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['verified'] = verified;
    data['companyname'] = companyname;
    data['role'] = role;
    data['__v'] = iV;
    data['address'] = address;
    data['dob'] = dob;
    data['fathersname'] = fathersname;
    data['firstname'] = firstname;
    data['image'] = image;
    data['lastname'] = lastname;
    data['middlename'] = middlename;
    data['pannumber'] = pannumber;
    data['mobile'] = mobile;
    return data;
  }
}

class AddDirectors {
  String firstname;
  String lastname;
  String? middlename;
  String email;
  String mobile;
  String dob;
  String pannumber;
  String fathersname;
  String address;
  File image;

  AddDirectors({
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
}
