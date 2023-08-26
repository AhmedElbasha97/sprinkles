// To parse this JSON data, do
//
//     final linksModel = linksModelFromJson(jsonString);

import 'dart:convert';

List<LinksModel> linksModelFromJson(String str) => List<LinksModel>.from(json.decode(str).map((x) => LinksModel.fromJson(x)));

String linksModelToJson(List<LinksModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LinksModel {
  String? facebook;
  String? twitter;
  String? youtube;
  String? instagram;
  String? ios;
  String? andriod;

  LinksModel({
    this.facebook,
    this.twitter,
    this.youtube,
    this.instagram,
    this.ios,
    this.andriod,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) => LinksModel(
    facebook: json["facebook"],
    twitter: json["twitter"],
    youtube: json["youtube"],
    instagram: json["instagram"],
    ios: json["ios"],
    andriod: json["andriod"],
  );

  Map<String, dynamic> toJson() => {
    "facebook": facebook,
    "twitter": twitter,
    "youtube": youtube,
    "instagram": instagram,
    "ios": ios,
    "andriod": andriod,
  };
}
