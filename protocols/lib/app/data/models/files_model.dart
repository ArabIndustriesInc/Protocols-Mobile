import 'dart:convert';
import 'dart:io';

FilesModel filesModelFromJson(String str) =>
    FilesModel.fromJson(json.decode(str));

String filesModelToJson(FilesModel data) => json.encode(data.toJson());

class FilesModel {
  FilesModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Files> data;

  factory FilesModel.fromJson(Map<String, dynamic> json) => FilesModel(
        success: json["success"],
        error: json["error"],
        data: List<Files>.from(json["data"].map((x) => Files.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Files {
  Files({
    required this.id,
    required this.image,
    required this.folderid,
    required this.registerid,
    required this.filename,
    required this.v,
  });

  String id;
  String image;
  String folderid;
  String registerid;
  String filename;
  int v;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        id: json["_id"],
        image: json["image"],
        folderid: json["folderid"],
        registerid: json["registerid"],
        filename: json["filename"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "folderid": folderid,
        "registerid": registerid,
        "filename": filename,
        "__v": v,
      };
}

class AddFiles {
  AddFiles({
    required this.image,
    required this.folderid,
    required this.filename,
  });

  File image;
  String folderid;
  String filename;
}
