

import 'dart:convert';

GetstateModel getstateModelFromJson(String str) =>
    GetstateModel.fromJson(json.decode(str));

String getstateModelToJson(GetstateModel data) => json.encode(data.toJson());

class GetstateModel {
  bool? status;
  int? responseCode;
  List<Statelist>? banklist;

  GetstateModel({
    this.status,
    this.responseCode,
    this.banklist,
  });

  factory GetstateModel.fromJson(Map<String, dynamic> json) => GetstateModel(
        status: json["status"],
        responseCode: json["response_code"],
        banklist: json["banklist"] == null
            ? []
            : List<Statelist>.from(
                json["banklist"]!.map((x) => Statelist.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response_code": responseCode,
        "banklist": banklist == null
            ? []
            : List<dynamic>.from(banklist!.map((x) => x.toJson())),
      };
}

class Statelist {
  int? id;
  String? statename;
  int? stateId;

  Statelist({
    this.id,
    this.statename,
    this.stateId,
  });

  factory Statelist.fromJson(Map<String, dynamic> json) => Statelist(
        id: json["id"],
        statename: json["statename"],
        stateId: json["stateId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "statename": statename,
        "stateId": stateId,
      };
}
