class Login {
  bool? success;
  bool? error;
  String? message;
  String? registerid;
  String? email;
  String? companyname;
  String? role;
  String? token;
  String? expiresIn;

  Login(
      {this.success,
      this.error,
      this.message,
      this.registerid,
      this.email,
      this.companyname,
      this.role,
      this.token,
      this.expiresIn});

  Login.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    message = json['message'];
    registerid = json['registerid'];
    email = json['email'];
    companyname = json['companyname'];
    role = json['role'];
    token = json['token'];
    expiresIn = json['expiresIn'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    data['message'] = message;
    data['registerid'] = registerid;
    data['email'] = email;
    data['companyname'] = companyname;
    data['role'] = role;
    data['token'] = token;
    data['expiresIn'] = expiresIn;
    return data;
  }
}
