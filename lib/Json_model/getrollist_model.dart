class rollidlist {
  int? iD;
  String? name;
  String? prefix;
  int? msrno;
  bool? outSide;
  bool? isDelete;
  bool? isActive;
  String? menuStr;
  int? iDStarting;
  int? resCount;
  String? packageID;
  int? price;
  String? createdDate;
  String? updatedDate;
  int? companyMemberID;
  int? typeRole;
  String? service;
  String? redirectUrl;

  rollidlist(
      {this.iD,
      this.name,
      this.prefix,
      this.msrno,
      this.outSide,
      this.isDelete,
      this.isActive,
      this.menuStr,
      this.iDStarting,
      this.resCount,
      this.packageID,
      this.price,
      this.createdDate,
      this.updatedDate,
      this.companyMemberID,
      this.typeRole,
      this.service,
      this.redirectUrl});

  rollidlist.fromJson(Map<String, dynamic> json) {
    iD = json['ID'] is double ? (json['ID'] as double).toInt() : json['ID'];
    name = json['Name'];
    prefix = json['Prefix'];
    msrno = json['Msrno'];
    outSide = json['OutSide'];
    isDelete = json['IsDelete'];
    isActive = json['IsActive'];
    menuStr = json['MenuStr'];
    iDStarting = json['IDStarting'];
    resCount = json['ResCount'];
    packageID = json['PackageID'];
    price = json['Price'] is double
        ? (json['Price'] as double).toInt()
        : json['Price'];
    createdDate = json['CreatedDate'];
    updatedDate = json['UpdatedDate'];
    companyMemberID = json['CompanyMemberID'];
    typeRole = json['TypeRole'];
    service = json['Service'];
    redirectUrl = json['RedirectUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Prefix'] = this.prefix;
    data['Msrno'] = this.msrno;
    data['OutSide'] = this.outSide;
    data['IsDelete'] = this.isDelete;
    data['IsActive'] = this.isActive;
    data['MenuStr'] = this.menuStr;
    data['IDStarting'] = this.iDStarting;
    data['ResCount'] = this.resCount;
    data['PackageID'] = this.packageID;
    data['Price'] = this.price;
    data['CreatedDate'] = this.createdDate;
    data['UpdatedDate'] = this.updatedDate;
    data['CompanyMemberID'] = this.companyMemberID;
    data['TypeRole'] = this.typeRole;
    data['Service'] = this.service;
    data['RedirectUrl'] = this.redirectUrl;
    return data;
  }
}
