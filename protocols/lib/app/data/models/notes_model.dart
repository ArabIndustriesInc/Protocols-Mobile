// To parse this JSON data, do
//
//     final notesModel = notesModelFromJson(jsonString);

import 'dart:convert';

NotesModel notesModelFromJson(String str) =>
    NotesModel.fromJson(json.decode(str));

String notesModelToJson(NotesModel data) => json.encode(data.toJson());

class NotesModel {
  NotesModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Notes> data;

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        success: json["success"],
        error: json["error"],
        data: List<Notes>.from(json["data"].map((x) => Notes.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Notes {
  Notes({
    required this.id,
    required this.noteid,
    required this.registerid,
    required this.v,
  });

  String id;
  Noteid noteid;
  String registerid;
  int v;

  factory Notes.fromJson(Map<String, dynamic> json) => Notes(
        id: json["_id"],
        noteid: Noteid.fromJson(json["noteid"]),
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "noteid": noteid.toJson(),
        "registerid": registerid,
        "__v": v,
      };
}

class Noteid {
  Noteid({
    required this.id,
    required this.title,
    required this.description,
    required this.registerid,
    required this.v,
  });

  String id;
  String title;
  String description;
  String registerid;
  int v;

  factory Noteid.fromJson(Map<String, dynamic> json) => Noteid(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "registerid": registerid,
        "__v": v,
      };
}

class AddNotes {
  AddNotes({
    required this.title,
    required this.description,
  });

  String title;
  String description;
}
