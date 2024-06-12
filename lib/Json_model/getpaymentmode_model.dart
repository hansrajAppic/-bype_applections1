class getpaymentmode_model {
  String? statuscode;
  String? status;
  List<paymentmodeData>? data;

  getpaymentmode_model({this.statuscode, this.status, this.data});

  getpaymentmode_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <paymentmodeData>[];
      json['data'].forEach((v) {
        data!.add(new paymentmodeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class paymentmodeData {
  int? iD;
  String? nAME;

  paymentmodeData({this.iD, this.nAME});

  paymentmodeData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    nAME = json['NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['NAME'] = this.nAME;
    return data;
  }
}