// To parse this JSON data, do
//
//     final votingModel = votingModelFromJson(jsonString);

import 'dart:convert';

VotingModel votingFromJson(String str) =>
    VotingModel.fromJson(json.decode(str));

String votingModelToJson(VotingModel data) => json.encode(data.toJson());

class VotingModel {
  VotingModel({
    required this.success,
    required this.error,
    required this.data,
  });

  bool success;
  bool error;
  List<Voting> data;

  factory VotingModel.fromJson(Map<String, dynamic> json) => VotingModel(
        success: json["success"],
        error: json["error"],
        data: List<Voting>.from(json["data"].map((x) => Voting.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Voting {
  Voting({
    required this.id,
    required this.title,
    required this.description,
    required this.selectdate,
    required this.registerid,
    required this.companyid,
    required this.v,
  });

  String id;
  String title;
  String description;
  String selectdate;
  String registerid;
  String companyid;
  int v;

  factory Voting.fromJson(Map<String, dynamic> json) => Voting(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        selectdate: json["selectdate"],
        registerid: json["registerid"],
        companyid: json["companyid"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "selectdate": selectdate,
        "registerid": registerid,
        "companyid": companyid,
        "__v": v,
      };
}

class VotingStatus {
  VotingStatus({
    required this.status,
    required this.voteId,
  });

  String status;
  String voteId;
}

class AddVoting {
  AddVoting({
    required this.title,
    required this.description,
    required this.selectdate,
  });

  String title;
  String description;
  String selectdate;
}
