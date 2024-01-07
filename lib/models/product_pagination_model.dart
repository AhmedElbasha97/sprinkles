import 'dart:convert';

import 'package:sprinkles/models/products_model.dart';

ProductPaginationModel productPaginationModelFromJson(String str) => ProductPaginationModel.fromJson(json.decode(str));

String productPaginationModelToJson(ProductPaginationModel data) => json.encode(data.toJson());

class ProductPaginationModel {
  int? totalItems;
  int? totalPages;
  int? currentPage;
  List<ProductsModel>? items;

  ProductPaginationModel({
    this.totalItems,
    this.totalPages,
    this.currentPage,
    this.items,
  });

  factory ProductPaginationModel.fromJson(Map<String, dynamic> json) => ProductPaginationModel(
    totalItems: json["total_items"],
    totalPages: json["total_pages"],
    currentPage: json["currentPage"],
    items: json["items"] == null ? json["data"] == null ?[]: List<ProductsModel>.from(json["data"]!.map((x) => ProductsModel.fromJson(x))): List<ProductsModel>.from(json["items"]!.map((x) => ProductsModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_items": totalItems,
    "total_pages": totalPages,
    "currentPage": currentPage,
    "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
  };
}

