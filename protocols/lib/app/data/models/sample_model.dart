// // To parse this JSON data, do
// //
// //     final directorsModel = directorsModelFromJson(jsonString);

// import 'dart:convert';

// DirectorsModel directorsModelFromJson(String str) =>
//     DirectorsModel.fromJson(json.decode(str));

// String directorsModelToJson(DirectorsModel data) => json.encode(data.toJson());

// class DirectorsModel {
//   DirectorsModel({
//     required this.success,
//     required this.error,
//     required this.data,
//   });

//   bool success;
//   bool error;
//   List<Directors> data;

//   factory DirectorsModel.fromJson(Map<String, dynamic> json) => DirectorsModel(
//         success: json["success"],
//         error: json["error"],
//         data: List<Directors>.from(
//             json["data"].map((x) => Directors.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "error": error,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Directors {
//   Directors({
//     required this.id,
//     this.firstname,
//     this.lastname,
//     required this.middlename,
//     required this.email,
//     required this.mobile,
//     required this.dob,
//     required this.pannumber,
//     required this.fathersname,
//     required this.address,
//     required this.image,
//     this.registerid,
//     required this.companyname,
//     required this.role,
//     required this.v,
//     this.password,
//     this.verified,
//   });

//   String id;
//   String? firstname;
//   Lastname? lastname;
//   Middlename middlename;
//   String email;
//   String mobile;
//   String dob;
//   String pannumber;
//   Fathersname fathersname;
//   Address address;
//   String image;
//   Directors? registerid;
//   Companyname companyname;
//   String role;
//   int v;
//   Password? password;
//   bool? verified;

//   factory Directors.fromJson(Map<String, dynamic> json) => Directors(
//         id: json["_id"],
//         firstname: json["firstname"],
//         lastname: lastnameValues.map[json["lastname"]]!,
//         middlename: middlenameValues.map[json["middlename"]]!,
//         email: json["email"],
//         mobile: json["mobile"],
//         dob: json["dob"],
//         pannumber: json["pannumber"],
//         fathersname: fathersnameValues.map[json["fathersname"]]!,
//         address: addressValues.map[json["address"]]!,
//         image: json["image"],
//         registerid: json["registerid"] == null
//             ? null
//             : Directors.fromJson(json["registerid"]),
//         companyname: companynameValues.map[json["companyname"]]!,
//         role: json["role"],
//         v: json["__v"],
//         password: passwordValues.map[json["password"]],
//         verified: json["verified"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "firstname": firstname,
//         "lastname": lastnameValues.reverse[lastname],
//         "middlename": middlenameValues.reverse[middlename],
//         "email": email,
//         "mobile": mobile,
//         "dob": dob,
//         "pannumber": pannumber,
//         "fathersname": fathersnameValues.reverse[fathersname],
//         "address": addressValues.reverse[address],
//         "image": image,
//         "registerid": registerid?.toJson(),
//         "companyname": companynameValues.reverse[companyname],
//         "role": role,
//         "__v": v,
//         "password": passwordValues.reverse[password],
//         "verified": verified,
//       };
// }

// enum Address { MALAPPURAM, ASDFGHJ, QWERTY, QWERTY1234 }

// final addressValues = EnumValues({
//   "asdfghj": Address.ASDFGHJ,
//   "malappuram": Address.MALAPPURAM,
//   "qwerty": Address.QWERTY,
//   "qwerty1234": Address.QWERTY1234
// });

// enum Companyname { A_A }

// final companynameValues = EnumValues({"A@A": Companyname.A_A});

// enum Fathersname { MURALIDAS_CK, SDFGHJ, QWERTY, QWERTY_QWERTY }

// final fathersnameValues = EnumValues({
//   "muralidas ck": Fathersname.MURALIDAS_CK,
//   "qwerty": Fathersname.QWERTY,
//   "qwerty qwerty": Fathersname.QWERTY_QWERTY,
//   "sdfghj": Fathersname.SDFGHJ
// });

// enum Lastname { MURALIDAS, ZXCVBN, MOHAN }

// final lastnameValues = EnumValues({
//   "mohan": Lastname.MOHAN,
//   "muralidas": Lastname.MURALIDAS,
//   "zxcvbn": Lastname.ZXCVBN
// });

// enum Middlename { EMPTY, MIDDLENAME, WERTYU }

// final middlenameValues = EnumValues({
//   "": Middlename.EMPTY,
//   ".": Middlename.MIDDLENAME,
//   "wertyu": Middlename.WERTYU
// });

// enum Password {
//   THE_2_A_10_T_I4_E_E_KT_5_W_TG99_TO88_XV_M_S44_MR_RH_T_JL0_DQJP6_YGCW2_RZ_LRN6_A_CY
// }

// final passwordValues = EnumValues({
//   "\u00242a\u002410\u0024tI4e/EKt/5wTG99To88XV.mS44MRRhTJl0dqjp6Ygcw2RzLRN6ACy":
//       Password
//           .THE_2_A_10_T_I4_E_E_KT_5_W_TG99_TO88_XV_M_S44_MR_RH_T_JL0_DQJP6_YGCW2_RZ_LRN6_A_CY
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
