// To parse this JSON data, do
//
//     final linksModel = linksModelFromJson(jsonString);

import 'dart:convert';

List<LinksModel> linksModelFromJson(String str) => List<LinksModel>.from(json.decode(str).map((x) => LinksModel.fromJson(x)));

String linksModelToJson(List<LinksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinksModel {
  String? facebook;
  String? tiktok;
  String? whatsApp;
  String? instagram;
  String? ios;
  String? andriod;
  String? snapchat;

  LinksModel({
    this.facebook,
    this.tiktok,
    this.whatsApp,
    this.instagram,
    this.ios,
    this.andriod,
    this.snapchat,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
    facebook: json["facebook"],
    tiktok: json["tiktok"],
    whatsApp: json["whatsApp"],
    instagram: json["instagram"],
    ios: json["ios"],
    andriod: json["andriod"],
    snapchat: json["snapchat"],
  );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "tiktok": tiktok,
    "whatsApp": whatsApp,
    "instagram": instagram,
    "ios": ios,
    "andriod": andriod,
    "snapchat": snapchat,
  };
}

