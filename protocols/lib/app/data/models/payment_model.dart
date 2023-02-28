class Payment {
  bool? success;
  bool? error;
  Paymentdetails? paymentdetails;

  Payment({this.success, this.error, this.paymentdetails});

  Payment.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    paymentdetails = json['paymentdetails'] != null
        ? Paymentdetails?.fromJson(json['paymentdetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['error'] = error;
    if (paymentdetails != null) {
      data['paymentdetails'] = paymentdetails?.toJson();
    }
    return data;
  }
}

class Paymentdetails {
  String? sId;
  String? name;
  String? address;
  String? amount;
  String? network;
  String? funding;
  String? cardnumber;
  String? registerid;
  String? companyid;
  int? iV;

  Paymentdetails(
      {this.sId,
      this.name,
      this.address,
      this.amount,
      this.network,
      this.funding,
      this.cardnumber,
      this.registerid,
      this.companyid,
      this.iV});

  Paymentdetails.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    address = json['address'];
    amount = json['amount'];
    network = json['network'];
    funding = json['funding'];
    cardnumber = json['cardnumber'];
    registerid = json['registerid'];
    companyid = json['companyid'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['address'] = address;
    data['amount'] = amount;
    data['network'] = network;
    data['funding'] = funding;
    data['cardnumber'] = cardnumber;
    data['registerid'] = registerid;
    data['companyid'] = companyid;
    data['__v'] = iV;
    return data;
  }
}

class AddPayment {
  String? tokenId;
  String? email;

  AddPayment({
    this.tokenId,
    this.email,
  });
}
