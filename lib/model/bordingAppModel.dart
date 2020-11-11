// To parse this JSON data, do
//
//     final boringAppModel = boringAppModelFromJson(jsonString);

import 'dart:convert';

BoringAppModel boringAppModelFromJson(String str) =>
    BoringAppModel.fromJson(json.decode(str));

String boringAppModelToJson(BoringAppModel data) => json.encode(data.toJson());

class BoringAppModel {
  BoringAppModel({
    this.activity,
    this.type,
    this.participants,
    this.price,
    this.link,
    this.key,
    this.accessibility,
  });

  String activity;
  String type;
  int participants;
  var price;
  String link;
  String key;
  var accessibility;

  factory BoringAppModel.fromJson(Map<String, dynamic> json) => BoringAppModel(
        activity: json["activity"],
        type: json["type"],
        participants: json["participants"],
        price: json["price"],
        link: json["link"],
        key: json["key"],
        accessibility: json["accessibility"],
      );

  Map<String, dynamic> toJson() => {
        "activity": activity,
        "type": type,
        "participants": participants,
        "price": price,
        "link": link,
        "key": key,
        "accessibility": accessibility,
      };
}
