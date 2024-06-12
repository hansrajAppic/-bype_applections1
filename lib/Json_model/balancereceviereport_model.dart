class Balancereceviereport_model {
  String? statuscode;
  String? status;
  List<Data>? data;

  Balancereceviereport_model({this.statuscode, this.status, this.data});

  Balancereceviereport_model.fromJson(Map<String, dynamic> json) {
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
  String? nAME;
  String? lOGINID;
  double? allsum;
  int? counts;
  String? mobile;
  String? aDDDATE;

  Data(
      {this.nAME,
      this.lOGINID,
      this.allsum,
      this.counts,
      this.mobile,
      this.aDDDATE});

  Data.fromJson(Map<String, dynamic> json) {
    nAME = json['NAME'];
    lOGINID = json['LOGINID'];
    allsum = json['Allsum'];
    counts = json['Counts'];
    mobile = json['mobile'];
    aDDDATE = json['ADDDATE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NAME'] = this.nAME;
    data['LOGINID'] = this.lOGINID;
    data['Allsum'] = this.allsum;
    data['Counts'] = this.counts;
    data['mobile'] = this.mobile;
    data['ADDDATE'] = this.aDDDATE;
    return data;
  }
}
