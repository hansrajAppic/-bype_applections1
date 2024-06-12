class ewallethistor_model {
  String? statuscode;
  String? status;
  List<ewallethDatalist>? data;

  ewallethistor_model({this.statuscode, this.status, this.data});

  ewallethistor_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ewallethDatalist>[];
      json['data'].forEach((v) {
        data!.add(new ewallethDatalist.fromJson(v));
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

class ewallethDatalist {
  String? description;
  double? openBalance;
  int? msrno;
  double? amount;
  double? bALANCE;
  String? nARRATION;
  String? transactionID;
  String? addDate;
  String? nAME;
  String? lOGINID;
  String? factor;

  ewallethDatalist(
      {this.description,
      this.openBalance,
      this.msrno,
      this.amount,
      this.bALANCE,
      this.nARRATION,
      this.transactionID,
      this.addDate,
      this.nAME,
      this.lOGINID,
      this.factor});

  ewallethDatalist.fromJson(Map<String, dynamic> json) {
    description = json['Description'];
    openBalance = json['OpenBalance'];
    msrno = json['msrno'];
    amount = json['Amount'];
    bALANCE = json['BALANCE'];
    nARRATION = json['NARRATION'];
    transactionID = json['TransactionID'];
    addDate = json['AddDate'];
    nAME = json['NAME'];
    lOGINID = json['LOGINID'];
    factor = json['Factor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Description'] = this.description;
    data['OpenBalance'] = this.openBalance;
    data['msrno'] = this.msrno;
    data['Amount'] = this.amount;
    data['BALANCE'] = this.bALANCE;
    data['NARRATION'] = this.nARRATION;
    data['TransactionID'] = this.transactionID;
    data['AddDate'] = this.addDate;
    data['NAME'] = this.nAME;
    data['LOGINID'] = this.lOGINID;
    data['Factor'] = this.factor;
    return data;
  }
}
