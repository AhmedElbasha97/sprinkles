// To parse this JSON data, do
//
//     final shopDetailedModel = shopDetailedModelFromJson(jsonString);

import 'dart:convert';

ShopDetailedModel shopDetailedModelFromJson(String str) => ShopDetailedModel.fromJson(json.decode(str));

String shopDetailedModelToJson(ShopDetailedModel data) => json.encode(data.toJson());

class ShopDetailedModel {
  int? id;
  String? name;
  String? nameEn;
  String? locationLon;
  String? locationLat;
  String? address;
  String? addressEn;
  String? phone;
  String? whatsapp;
  String? desc;
  String? descEn;
  int? star;
  List<Ctg>? ctgs;
  String? image;

  ShopDetailedModel({
    this.id,
    this.name,
    this.nameEn,
    this.locationLon,
    this.locationLat,
    this.address,
    this.addressEn,
    this.phone,
    this.whatsapp,
    this.desc,
    this.descEn,
    this.star,
    this.ctgs,
    this.image,
  });

  factory ShopDetailedModel.fromJson(Map<String, dynamic> json) => ShopDetailedModel(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
    locationLon: json["location_lon"],
    locationLat: json["location_lat"],
    address: json["address"],
    addressEn: json["address_en"],
    phone: json["phone"],
    whatsapp: json["whatsapp"],
    desc: json["desc"],
    descEn: json["desc_en"],
    star: json["star"],
    ctgs: json["ctgs"] == null ? [] : List<Ctg>.from(json["ctgs"]!.map((x) => Ctg.fromJson(x))),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
    "location_lon": locationLon,
    "location_lat": locationLat,
    "address": address,
    "address_en": addressEn,
    "phone": phone,
    "whatsapp": whatsapp,
    "desc": desc,
    "desc_en": descEn,
    "star": star,
    "ctgs": ctgs == null ? [] : List<dynamic>.from(ctgs!.map((x) => x.toJson())),
    "image": image,
  };
}

class Ctg {
  int? id;
  String? name;
  String? nameEn;

  Ctg({
    this.id,
    this.name,
    this.nameEn,
  });

  factory Ctg.fromJson(Map<String, dynamic> json) => Ctg(
    id: json["id"],
    name: json["name"],
    nameEn: json["name_en"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "name_en": nameEn,
  };
}
