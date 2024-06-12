// ignore_for_file: camel_case_types, unnecessary_new, prefer_collection_literals

class Checknumber_model {
  String? statuscode;
  String? status;

  Checknumber_model(data, {this.statuscode, this.status});

  Checknumber_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = statuscode;
    data['status'] = status;
    return data;
  }
}
