class getactiveaepsbank_model {
  String? statuscode;
  String? status;
  List<getData>? data;

  getactiveaepsbank_model({this.statuscode, this.status, this.data});

  getactiveaepsbank_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <getData>[];
      json['data'].forEach((v) {
        data!.add(new getData.fromJson(v));
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

class getData {
  int? iD;
  String? name;
  String? status;

  getData({this.iD, this.name, this.status});

  getData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Status'] = this.status;
    return data;
  }
}
