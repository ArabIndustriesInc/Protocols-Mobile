// To parse this JSON data, do
//
//     final accounts = accountsFromJson(jsonString);

import 'dart:convert';

AccountsModel accountsFromJson(String str) =>
    AccountsModel.fromJson(json.decode(str));

String accountsToJson(AccountsModel data) => json.encode(data.toJson());

class AccountsModel {
  AccountsModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Accounts> data;

  factory AccountsModel.fromJson(Map<String, dynamic> json) => AccountsModel(
        success: json["success"],
        error: json["error"],
        data:
            List<Accounts>.from(json["data"].map((x) => Accounts.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Accounts {
  Accounts({
    required this.id,
    required this.bankname,
    required this.nickname,
    required this.accountname,
    required this.ifsc,
    required this.accountnumber,
    required this.registerid,
    required this.v,
  });

  String id;
  String bankname;
  String nickname;
  String accountname;
  String ifsc;
  String accountnumber;
  String registerid;
  int v;

  factory Accounts.fromJson(Map<String, dynamic> json) => Accounts(
        id: json["_id"],
        bankname: json["bankname"],
        nickname: json["Nickname"],
        accountname: json["accountname"],
        ifsc: json["ifsc"],
        accountnumber: json["accountnumber"],
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "bankname": bankname,
        "Nickname": nickname,
        "accountname": accountname,
        "ifsc": ifsc,
        "accountnumber": accountnumber,
        "registerid": registerid,
        "__v": v,
      };
}

class AddAccounts {
  AddAccounts({
    required this.bankname,
    required this.nickname,
    required this.accountname,
    required this.ifsc,
    required this.accountnumber,
  });

  String bankname;
  String nickname;
  String accountname;
  String ifsc;
  String accountnumber;
}
