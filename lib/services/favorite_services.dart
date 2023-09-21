import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/models/shops_model.dart';
class FavoriteServices {
  static ApiService api = ApiService();
  static Future<List<ShopsModel>?> getFavoriteShopsList() async {
    List<ShopsModel>? shopFavList = [];
    var data = await api.request(Services.getFavoriteShopDataEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var shop in data){
        shopFavList.add(ShopsModel.fromJson(shop));
      }
      return shopFavList;
    }
    return null;
  }
  static Future<FavoriteStatusModel?> getShopIsInFavoriteOrNot(String shopId) async {
    var data = await api.request(Services.getShopIsInFavoriteOrNotEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "shop_id":shopId
    });
    if (data != null) {
      return FavoriteStatusModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> addOrRemoveShopFromFavorite(String shopId,String status) async {
    var data = await api.request(Services.addOrRemoveShopToFavoriteEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "shop_id":shopId,
      "status":status
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
  static Future<List<ProductsModel>?> getFavoriteProductsList() async {
    List<ProductsModel>? productFavList = [];
    var data = await api.request(Services.getFavoriteProductDataEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var shop in data){
        productFavList.add(ProductsModel.fromJson(shop));
      }
      return productFavList;
    }
    return null;
  }
  static Future<FavoriteStatusModel?> getProductIsInFavoriteOrNot(String productId) async {
    var data = await api.request(Services.getProductsInFavoriteOrNotEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "item_id":productId
    });
    if (data != null) {
      return FavoriteStatusModel.fromJson(data);
    }
    return null;
  }
  static Future<ResponseModel?> addOrRemoveProductFromFavorite(String productId,String status) async {
    var data = await api.request(Services.addOrRemoveProductToFavoriteEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "item_id":productId,
      "status":status
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}