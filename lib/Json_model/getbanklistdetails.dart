class Defolatgetbankdetails {
  String? statuscode;
  String? status;
  List<banklistdata>? data;

  Defolatgetbankdetails({this.statuscode, this.status, this.data});

  Defolatgetbankdetails.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <banklistdata>[];
      json['data'].forEach((v) {
        data!.add(new banklistdata.fromJson(v));
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

class banklistdata {
  int? iD;
  int? msrno;
  int? bankID;
  String? name;
  String? iFSCCode;
  String? accountNumber;
  String? accountHolderName;
  String? branchName;
  bool? isActive;
  bool? isDelete;
  String? addDate;
  String? lastUpdate;
  String? memberID;

  banklistdata(
      {this.iD,
      this.msrno,
      this.bankID,
      this.name,
      this.iFSCCode,
      this.accountNumber,
      this.accountHolderName,
      this.branchName,
      this.isActive,
      this.isDelete,
      this.addDate,
      this.lastUpdate,
      this.memberID});

  banklistdata.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    msrno = json['Msrno'];
    bankID = json['BankID'];
    name = json['Name'];
    iFSCCode = json['IFSCCode'];
    accountNumber = json['AccountNumber'];
    accountHolderName = json['AccountHolderName'];
    branchName = json['BranchName'];
    isActive = json['IsActive'];
    isDelete = json['IsDelete'];
    addDate = json['AddDate'];
    lastUpdate = json['LastUpdate'];
    memberID = json['MemberID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Msrno'] = this.msrno;
    data['BankID'] = this.bankID;
    data['Name'] = this.name;
    data['IFSCCode'] = this.iFSCCode;
    data['AccountNumber'] = this.accountNumber;
    data['AccountHolderName'] = this.accountHolderName;
    data['BranchName'] = this.branchName;
    data['IsActive'] = this.isActive;
    data['IsDelete'] = this.isDelete;
    data['AddDate'] = this.addDate;
    data['LastUpdate'] = this.lastUpdate;
    data['MemberID'] = this.memberID;
    return data;
  }
}
