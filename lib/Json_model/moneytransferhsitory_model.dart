class moneytransferhsitory_model {
  String? statuscode;
  String? status;
  List<moneytransfeData>? data;

  moneytransferhsitory_model({this.statuscode, this.status, this.data});

  moneytransferhsitory_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <moneytransfeData>[];
      json['data'].forEach((v) {
        data!.add(new moneytransfeData.fromJson(v));
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

class moneytransfeData {
  double? finalAmount;
  String? bankName;
  int? msrno;
  String? number;
  double? amount;
  String? ifsc;
  double? surcharge;
  String? referenceNumber;
  String? status;
  String? transID;
  String? rrn;
  String? addDate;
  String? nAME;
  String? lOGINID;
  String? senderName;
  String? senderNumber;

  moneytransfeData(
      {this.finalAmount,
      this.bankName,
      this.msrno,
      this.number,
      this.amount,
      this.ifsc,
      this.surcharge,
      this.referenceNumber,
      this.status,
      this.transID,
      this.rrn,
      this.addDate,
      this.nAME,
      this.lOGINID,
      this.senderName,
      this.senderNumber});

  moneytransfeData.fromJson(Map<String, dynamic> json) {
    finalAmount = json['FinalAmount'];
    bankName = json['bank_name'];
    msrno = json['msrno'];
    number = json['number'];
    amount = json['Amount'];
    ifsc = json['ifsc'];
    surcharge = json['Surcharge'];
    referenceNumber = json['reference_number'];
    status = json['status'];
    transID = json['TransID'];
    rrn = json['rrn'];
    addDate = json['AddDate'];
    nAME = json['NAME'];
    lOGINID = json['LOGINID'];
    senderName = json['SenderName'];
    senderNumber = json['SenderNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['FinalAmount'] = this.finalAmount;
    data['bank_name'] = this.bankName;
    data['msrno'] = this.msrno;
    data['number'] = this.number;
    data['Amount'] = this.amount;
    data['ifsc'] = this.ifsc;
    data['Surcharge'] = this.surcharge;
    data['reference_number'] = this.referenceNumber;
    data['status'] = this.status;
    data['TransID'] = this.transID;
    data['rrn'] = this.rrn;
    data['AddDate'] = this.addDate;
    data['NAME'] = this.nAME;
    data['LOGINID'] = this.lOGINID;
    data['SenderName'] = this.senderName;
    data['SenderNumber'] = this.senderNumber;
    return data;
  }
}
