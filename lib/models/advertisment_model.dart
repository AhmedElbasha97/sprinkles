// To parse this JSON data, do
//
//     final advertismentModel = advertismentModelFromJson(jsonString);

import 'dart:convert';

List<AdvertismentModel> advertismentModelFromJson(String str) => List<AdvertismentModel>.from(json.decode(str).map((x) => AdvertismentModel.fromJson(x)));

String advertismentModelToJson(List<AdvertismentModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdvertismentModel {
  int? id;
  String? img;
  String? link;

  AdvertismentModel({
    this.id,
    this.img,
    this.link,
  });

  factory AdvertismentModel.fromJson(Map<String, dynamic> json) => AdvertismentModel(
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
