// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  TodoModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Todo> data;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        success: json["success"],
        error: json["error"],
        data: List<Todo>.from(json["data"].map((x) => Todo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Todo {
  Todo({
    required this.id,
    required this.todoid,
    required this.task,
    required this.status,
    required this.registerid,
    required this.v,
  });

  String id;
  Todoid todoid;
  String task;
  int status;
  String registerid;
  int v;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        id: json["_id"],
        todoid: Todoid.fromJson(json["todoid"]),
        task: json["task"],
        status: json["status"],
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "todoid": todoid.toJson(),
        "task": task,
        "status": status,
        "registerid": registerid,
        "__v": v,
      };
}

class Todoid {
  Todoid({
    required this.id,
    required this.title,
    required this.deadline,
    required this.registerid,
    required this.v,
  });

  String id;
  String title;
  DateTime deadline;
  String registerid;
  int v;

  factory Todoid.fromJson(Map<String, dynamic> json) => Todoid(
        id: json["_id"],
        title: json["title"],
        deadline: DateTime.parse(json["deadline"]),
        registerid: json["registerid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "deadline":
            "${deadline.year.toString().padLeft(4, '0')}-${deadline.month.toString().padLeft(2, '0')}-${deadline.day.toString().padLeft(2, '0')}",
        "registerid": registerid,
        "__v": v,
      };
}

class AddTodo {
  AddTodo({
    required this.title,
    required this.deadline,
    required this.task,
  });

  String title;
  String deadline;
  String task;
}
