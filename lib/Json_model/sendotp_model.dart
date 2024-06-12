// ignore_for_file: unnecessary_this, prefer_collection_literals

class sendotp_model {
  String? statuscode;
  String? status;
  Data? data;

  sendotp_model({this.statuscode, this.status, this.data});

  sendotp_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? oTP;
  String? mobile;

  Data({this.oTP, this.mobile});

  Data.fromJson(Map<String, dynamic> json) {
    oTP = json['OTP'];
    mobile = json['Mobile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['OTP'] = this.oTP;
    data['Mobile'] = this.mobile;
    return data;
  }
}
