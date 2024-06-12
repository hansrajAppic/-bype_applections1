// ignore_for_file: unnecessary_this

class historyreport_model {
  String? statuscode;
  String? status;
  List<Datahistory>? data;

  historyreport_model({this.statuscode, this.status, this.data});

  historyreport_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Datahistory>[];
      json['data'].forEach((v) {
        data!.add(new Datahistory.fromJson(v));
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

class Datahistory {
  String? mobileno;
  double? amount;
  String? transID;
  String? status;
  String? apitransid;
  String? apimessage;
  String? sERVICENAME;
  String? oPERATORNAME;
  String? lOGINID;
  String? addDate;
  double? commission;
  String? logo;
  String? disputeStatus;

  Datahistory(
      {this.mobileno,
      this.amount,
      this.transID,
      this.status,
      this.apitransid,
      this.apimessage,
      this.sERVICENAME,
      this.oPERATORNAME,
      this.lOGINID,
      this.addDate,
      this.commission,
      this.logo,
      this.disputeStatus});

  Datahistory.fromJson(Map<String, dynamic> json) {
    mobileno = json['Mobileno'];
    amount = json['Amount'];
    transID = json['TransID'];
    status = json['Status'];
    apitransid = json['apitransid'];
    apimessage = json['apimessage'];
    sERVICENAME = json['SERVICENAME'];
    oPERATORNAME = json['OPERATORNAME'];
    lOGINID = json['LOGINID'];
    addDate = json['AddDate'];
    commission = json['Commission'];
    logo = json['logo'];
    disputeStatus = json['DisputeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Mobileno'] = this.mobileno;
    data['Amount'] = this.amount;
    data['TransID'] = this.transID;
    data['Status'] = this.status;
    data['apitransid'] = this.apitransid;
    data['apimessage'] = this.apimessage;
    data['SERVICENAME'] = this.sERVICENAME;
    data['OPERATORNAME'] = this.oPERATORNAME;
    data['LOGINID'] = this.lOGINID;
    data['AddDate'] = this.addDate;
    data['Commission'] = this.commission;
    data['logo'] = this.logo;
    data['DisputeStatus'] = this.disputeStatus;
    return data;
  }
}
