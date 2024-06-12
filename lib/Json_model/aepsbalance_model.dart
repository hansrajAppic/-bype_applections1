class aepsbalance_model {
  String? statuscode;
  String? status;
  List<Data>? data;

  aepsbalance_model({this.statuscode, this.status, this.data});

  aepsbalance_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  bool? registration;
  bool? authntication;
  double? balance;
  String? device;

  Data({this.registration, this.authntication, this.balance, this.device});

  Data.fromJson(Map<String, dynamic> json) {
    registration = json['registration'];
    authntication = json['Authntication'];
    balance = json['balance'];
    device = json['Device'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['registration'] = this.registration;
    data['Authntication'] = this.authntication;
    data['balance'] = this.balance;
    data['Device'] = this.device;
    return data;
  }
}