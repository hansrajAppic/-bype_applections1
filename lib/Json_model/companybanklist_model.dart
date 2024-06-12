class Companybanklist_model {
  String? statuscode;
  String? status;
  List<CompanyData>? data;

  Companybanklist_model({this.statuscode, this.status, this.data});

  Companybanklist_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <CompanyData>[];
      json['data'].forEach((v) {
        data!.add(new CompanyData.fromJson(v));
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

class CompanyData {
  int? iD;
  String? accountNumber;

  CompanyData({this.iD, this.accountNumber});

  CompanyData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    accountNumber = json['AccountNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['AccountNumber'] = this.accountNumber;
    return data;
  }
}
