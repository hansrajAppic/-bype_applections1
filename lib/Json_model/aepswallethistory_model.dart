class aepswallethistory_model {
  String? statuscode;
  String? status;
  List<aepswallethData>? data;

  aepswallethistory_model({this.statuscode, this.status, this.data});

  aepswallethistory_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <aepswallethData>[];
      json['data'].forEach((v) {
        data!.add(new aepswallethData.fromJson(v));
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

class aepswallethData {
  int? msrno;
  double? amount;
  double? bALANCE;
  String? nARRATION;
  String? transID;
  String? addDate;
  String? nAME;
  String? lOGINID;
  String? factor;

  aepswallethData(
      {this.msrno,
      this.amount,
      this.bALANCE,
      this.nARRATION,
      this.transID,
      this.addDate,
      this.nAME,
      this.lOGINID,
      this.factor});

  aepswallethData.fromJson(Map<String, dynamic> json) {
    msrno = json['msrno'];
    amount = json['Amount'];
    bALANCE = json['BALANCE'];
    nARRATION = json['NARRATION'];
    transID = json['TransID'];
    addDate = json['AddDate'];
    nAME = json['NAME'];
    lOGINID = json['LOGINID'];
    factor = json['Factor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msrno'] = this.msrno;
    data['Amount'] = this.amount;
    data['BALANCE'] = this.bALANCE;
    data['NARRATION'] = this.nARRATION;
    data['TransID'] = this.transID;
    data['AddDate'] = this.addDate;
    data['NAME'] = this.nAME;
    data['LOGINID'] = this.lOGINID;
    data['Factor'] = this.factor;
    return data;
  }
}
