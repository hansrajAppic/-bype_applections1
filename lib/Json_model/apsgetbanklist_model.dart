class getbanklist_model {
  bool? status;
  int? responseCode;
  Banklist? banklist;

  getbanklist_model({this.status, this.responseCode, this.banklist});

  getbanklist_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['response_code'];
    banklist = json['banklist'] != null
        ? new Banklist.fromJson(json['banklist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response_code'] = this.responseCode;
    if (this.banklist != null) {
      data['banklist'] = this.banklist!.toJson();
    }
    return data;
  }
}

class Banklist {
  bool? status;
  String? message;
  List<Data>? data;

  Banklist({this.status, this.message, this.data});

  Banklist.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? bankName;
  String? iinno;
  String? aadharpayiino;
  String? activeFlag;
  String? cdFlag;

  Data(
      {this.id,
      this.bankName,
      this.iinno,
      this.aadharpayiino,
      this.activeFlag,
      this.cdFlag});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bankName'];
    iinno = json['iinno'];
    aadharpayiino = json['aadharpayiino'];
    activeFlag = json['activeFlag'];
    cdFlag = json['cd_flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bankName'] = this.bankName;
    data['iinno'] = this.iinno;
    data['aadharpayiino'] = this.aadharpayiino;
    data['activeFlag'] = this.activeFlag;
    data['cd_flag'] = this.cdFlag;
    return data;
  }
}
