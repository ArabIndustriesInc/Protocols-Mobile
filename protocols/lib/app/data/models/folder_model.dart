// To parse this JSON data, do
//
//     final foldersModel = foldersModelFromJson(jsonString);

import 'dart:convert';

FoldersModel foldersModelFromJson(String str) =>
    FoldersModel.fromJson(json.decode(str));

String foldersModelToJson(FoldersModel data) => json.encode(data.toJson());

class FoldersModel {
  FoldersModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Folders> data;

  factory FoldersModel.fromJson(Map<String, dynamic> json) => FoldersModel(
        success: json["success"],
        error: json["error"],
        data: List<Folders>.from(json["data"].map((x) => Folders.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Folders {
  Folders({
    required this.id,
    required this.foldername,
    required this.registerid,
    required this.v,
  });

  String id;
  String foldername;
  String registerid;
  int v;

  factory Folders.fromJson(Map<String, dynamic> json) => Folders(
        id: json["_id"],
        foldername: json["foldername"],
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "foldername": foldername,
        "registerid": registerid,
        "__v": v,
      };
}

class AddFolders {
  AddFolders({
    required this.foldername,
  });

  String foldername;
}
