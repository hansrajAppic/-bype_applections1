// To parse this JSON data, do
//
//     final getbanklist = getbanklistFromJson(jsonString);

import 'dart:convert';

Getbanklist getbanklistFromJson(String str) => Getbanklist.fromJson(json.decode(str));

String getbanklistToJson(Getbanklist data) => json.encode(data.toJson());

class Getbanklist {
    String? statuscode;
    String? status;
    List<banklist>? data;

    Getbanklist({
        this.statuscode,
        this.status,
        this.data,
    });

    factory Getbanklist.fromJson(Map<String, dynamic> json) => Getbanklist(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null ? [] : List<banklist>.from(json["data"]!.map((x) => banklist.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class banklist {
    int? id;
    String? name;
    String? ifsc;
    String? class1;
    bool? isDelete;
    bool? isActive;
    String? createdDate;
    dynamic updatedDate;
    String? img;

    banklist({
        this.id,
        this.name,
        this.ifsc,
        this.class1,
        this.isDelete,
        this.isActive,
        this.createdDate,
        this.updatedDate,
        this.img,
    });

    factory banklist.fromJson(Map<String, dynamic> json) => banklist(
        id: json["ID"],
        name: json["Name"],
        ifsc: json["IFSC"],
        class1: json["class1"],
        isDelete: json["IsDelete"],
        isActive: json["IsActive"],
        createdDate: json["CreatedDate"],
        updatedDate: json["UpdatedDate"],
        img: json["Img"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "IFSC": ifsc,
        "class1": class1,
        "IsDelete": isDelete,
        "IsActive": isActive,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
        "Img": img,
    };
}
