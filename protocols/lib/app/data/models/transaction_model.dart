// To parse this JSON data, do
//
//     final transactions = transactionsFromJson(jsonString);

import 'dart:convert';

TransactionsModel transactionsFromJson(String str) =>
    TransactionsModel.fromJson(json.decode(str));

String transactionsToJson(TransactionsModel data) => json.encode(data.toJson());

class TransactionsModel {
  TransactionsModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Transactions> data;

  factory TransactionsModel.fromJson(Map<String, dynamic> json) =>
      TransactionsModel(
        success: json["success"],
        error: json["error"],
        data: List<Transactions>.from(
            json["data"].map((x) => Transactions.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Transactions {
  Transactions({
    required this.id,
    required this.title,
    required this.description,
    required this.amount,
    required this.type,
    required this.selecttime,
    required this.selectdate,
    required this.registerid,
    required this.v,
  });

  String id;
  String title;
  String description;
  String amount;
  String type;
  String selecttime;
  DateTime selectdate;
  String registerid;
  int v;

  factory Transactions.fromJson(Map<String, dynamic> json) => Transactions(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        amount: json["amount"],
        type: json["type"],
        selecttime: json["selecttime"],
        selectdate: DateTime.parse(json["selectdate"]),
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "amount": amount,
        "type": type,
        "selecttime": selecttime,
        "selectdate":
            "${selectdate.year.toString().padLeft(4, '0')}-${selectdate.month.toString().padLeft(2, '0')}-${selectdate.day.toString().padLeft(2, '0')}",
        "registerid": registerid,
        "__v": v,
      };
}

class AddTransactions {
  AddTransactions({
    required this.title,
    required this.description,
    required this.amount,
    required this.type,
    required this.selecttime,
    required this.selectdate,
  });

  String title;
  String description;
  String amount;
  String type;
  String selecttime;
  String selectdate;
}
