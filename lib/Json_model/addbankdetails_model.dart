class addbankdetails {
  String? statuscode;
  String? status;

  addbankdetails({this.statuscode, this.status});

  addbankdetails.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    return data;
  }
}
