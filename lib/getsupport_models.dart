class GetsupportModels {
  String? statuscode;
  String? status;
  List<Getsupport>? data;

  GetsupportModels({this.statuscode, this.status, this.data});

  GetsupportModels.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Getsupport>[];
      json['data'].forEach((v) {
        data!.add(new Getsupport.fromJson(v));
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

class Getsupport {
  int? iD;
  String? name;
  String? description;
  Null? image;
  int? msrno;
  int? companyMemberID;
  bool? isActive;
  String? addDate;
  String? updateDate;
  String? status;

  Getsupport(
      {this.iD,
      this.name,
      this.description,
      this.image,
      this.msrno,
      this.companyMemberID,
      this.isActive,
      this.addDate,
      this.updateDate,
      this.status});

  Getsupport.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
    image = json['Image'];
    msrno = json['Msrno'];
    companyMemberID = json['CompanyMemberID'];
    isActive = json['IsActive'];
    addDate = json['AddDate'];
    updateDate = json['UpdateDate'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Image'] = this.image;
    data['Msrno'] = this.msrno;
    data['CompanyMemberID'] = this.companyMemberID;
    data['IsActive'] = this.isActive;
    data['AddDate'] = this.addDate;
    data['UpdateDate'] = this.updateDate;
    data['Status'] = this.status;
    return data;
  }
}
