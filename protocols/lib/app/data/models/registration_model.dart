import 'dart:convert';

Registration registerationFromJson(String str) =>
    Registration.fromJson(json.decode(str));

String registerationToJson(Registration data) => json.encode(data.toJson());

class Registration {
  Registration({
    required this.success,
    required this.error,
    required this.message,
    required this.data,
  });

  bool success;
  bool error;
  String message;
  Register data;

  factory Registration.fromJson(Map<String, dynamic> json) => Registration(
        success: json["success"],
        error: json["error"],
        message: json["message"],
        data: Register.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "error": error,
        "message": message,
        "data": data.toJson(),
      };
}

class Register {
  Register({
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.password,
    required this.companyname,
    required this.id,
    required this.v,
  });

  String firstname;
  String lastname;
  String email;
  String password;
  String companyname;
  String id;
  int v;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        password: json["password"],
        companyname: json["companyname"],
        id: json["_id"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "password": password,
        "companyname": companyname,
        "_id": id,
        "__v": v,
      };
}
