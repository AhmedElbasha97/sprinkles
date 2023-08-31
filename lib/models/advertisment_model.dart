// To parse this JSON data, do
//
//     final advertismentModel = advertismentModelFromJson(jsonString);

import 'dart:convert';

List<AdvertisementModel> advertismentModelFromJson(String str) => List<AdvertisementModel>.from(json.decode(str).map((x) => AdvertisementModel.fromJson(x)));

String advertismentModelToJson(List<AdvertisementModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertisementModel {
  int? id;
  String? img;
  String? link;

  AdvertisementModel({
    this.id,
    this.img,
    this.link,
  });

  factory AdvertisementModel.fromJson(Map<String, dynamic> json) => AdvertisementModel(
    id: json["id"],
    img: json["img"],
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "img": img,
    "link": link,
  };
}
