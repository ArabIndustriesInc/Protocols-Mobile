// To parse this JSON data, do
//
//     final employeesModel = employeesModelFromJson(jsonString);

import 'dart:convert';
import 'dart:io';

EmployeesModel employeesModelFromJson(String str) =>
    EmployeesModel.fromJson(json.decode(str));

String employeesModelToJson(EmployeesModel data) => json.encode(data.toJson());

class EmployeesModel {
  EmployeesModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Employees> data;

  factory EmployeesModel.fromJson(Map<String, dynamic> json) => EmployeesModel(
        success: json["success"],
        error: json["error"],
        data: List<Employees>.from(
            json["data"].map((x) => Employees.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Employees {
  Employees({
    required this.id,
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.joiningdate,
    required this.employeeid,
    required this.worklocation,
    required this.uannumber,
    required this.esinumber,
    required this.image,
    required this.dob,
    required this.mobile,
    required this.email,
    required this.pannumber,
    required this.fathersname,
    required this.address,
    this.paymentMode,
    required this.bank,
    required this.type,
    required this.ifsc,
    required this.accName,
    required this.accNo,
    required this.position,
    required this.registerid,
    required this.v,
    this.pfaccountnumber,
  });

  String id;
  String firstname;
  String middlename;
  String lastname;
  String joiningdate;
  String employeeid;
  String worklocation;
  String uannumber;
  String esinumber;
  String image;
  String dob;
  String mobile;
  String email;
  String pannumber;
  String fathersname;
  String address;
  String? paymentMode;
  String bank;
  String type;
  String ifsc;
  String accName;
  String accNo;
  String position;
  Registerid registerid;
  int v;
  String? pfaccountnumber;

  factory Employees.fromJson(Map<String, dynamic> json) => Employees(
        id: json["_id"],
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        joiningdate: json["joiningdate"],
        employeeid: json["employeeid"],
        worklocation: json["worklocation"],
        uannumber: json["uannumber"],
        esinumber: json["esinumber"],
        image: json["image"],
        dob: json["dob"],
        mobile: json["mobile"],
        email: json["email"],
        pannumber: json["pannumber"],
        fathersname: json["fathersname"],
        address: json["address"],
        paymentMode: json["paymentMode"],
        bank: json["bank"],
        type: json["type"],
        ifsc: json["ifsc"],
        accName: json["accName"],
        accNo: json["accNo"],
        position: json["position"],
        registerid: Registerid.fromJson(json["registerid"]),
        v: json["__v"],
        pfaccountnumber: json["pfaccountnumber"] ?? 'Nil',
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "joiningdate": joiningdate,
        "employeeid": employeeid,
        "worklocation": worklocation,
        "uannumber": uannumber,
        "esinumber": esinumber,
        "image": image,
        "dob": dob,
        "mobile": mobile,
        "email": email,
        "pannumber": pannumber,
        "fathersname": fathersname,
        "address": address,
        "paymentMode": paymentMode,
        "bank": bank,
        "type": type,
        "ifsc": ifsc,
        "accName": accName,
        "accNo": accNo,
        "position": position,
        "registerid": registerid.toJson(),
        "__v": v,
        "pfaccountnumber": pfaccountnumber,
      };
}

class Registerid {
  Registerid({
    required this.id,
    required this.email,
    required this.password,
    required this.verified,
    required this.companyname,
    required this.role,
    required this.v,
    required this.firstname,
    required this.lastname,
  });

  String id;
  String email;
  String password;
  bool verified;
  String companyname;
  String role;
  int v;
  String firstname;
  String lastname;

  factory Registerid.fromJson(Map<String, dynamic> json) => Registerid(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        verified: json["verified"],
        companyname: json["companyname"],
        role: json["role"],
        v: json["__v"],
        firstname: json["firstname"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "verified": verified,
        "companyname": companyname,
        "role": role,
        "__v": v,
        // "${dob.year.toString().padLeft(4, '0')}-${dob.month.toString().padLeft(2, '0')}-${dob.day.toString().padLeft(2, '0')}",
        "firstname": firstname,
        "lastname": lastname,
      };
}

class AddEmployees {
  AddEmployees({
    required this.firstname,
    this.middlename,
    required this.lastname,
    required this.joiningdate,
    required this.employeeid,
    required this.worklocation,
    required this.uannumber,
    this.esinumber,
    required this.image,
    required this.dob,
    required this.mobile,
    required this.email,
    required this.pannumber,
    required this.fathersname,
    required this.address,
    required this.paymentMode,
    required this.bank,
    required this.type,
    required this.ifsc,
    required this.accName,
    required this.accNo,
    required this.position,
    required this.pfaccountnumber,
  });

  String firstname;
  String? middlename;
  String lastname;
  String joiningdate;
  String employeeid;
  String worklocation;
  String uannumber;
  String? esinumber;
  File image;
  String dob;
  String mobile;
  String email;
  String pannumber;
  String fathersname;
  String address;
  String paymentMode;
  String bank;
  String type;
  String ifsc;
  String accName;
  String accNo;
  String position;
  String pfaccountnumber;
}
