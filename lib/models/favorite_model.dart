// To parse this JSON data, do
//
//     final favoriteStatusModel = favoriteStatusModelFromJson(jsonString);

import 'dart:convert';

FavoriteStatusModel favoriteStatusModelFromJson(String str) => FavoriteStatusModel.fromJson(json.decode(str));

String favoriteStatusModelToJson(FavoriteStatusModel data) => json.encode(data.toJson());

class FavoriteStatusModel {
  int? status;

  FavoriteStatusModel({
    this.status,
  });

  factory FavoriteStatusModel.fromJson(Map<String, dynamic> json) => FavoriteStatusModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
