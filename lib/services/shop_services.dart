import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/shops_model.dart';

import '../models/shop_detailed_model.dart';


class ShopServices {
  static ApiService api = ApiService();
  static Future<List<ShopsModel>?> getAllShops(String filterData) async {
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.shopEndPoint, "POST",queryParamters: {
      "sort":filterData,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var shop in data){
        shopList.add(ShopsModel.fromJson(shop));
      }
      return shopList;
    }
    return null;
  }
  static Future<List<ShopsModel>?> getShopsForMainCategory(int mainCategoryId,String filterData) async {
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.shopEndPoint, "POST",queryParamters: {
      "ctgid":mainCategoryId,
      "sort":filterData,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var shop in data){
        shopList.add(ShopsModel.fromJson(shop));
      }
      return shopList;
    }
    return null;
  }
  static Future<ShopDetailedModel?> getShopDetails(String shopId) async {
    var data = await api.request(Services.shopDetailedEndPoint, "POST",queryParamters: {
      "shop_id":shopId,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {


      return ShopDetailedModel.fromJson(data);
    }
    return null;
  }
  static Future<List<ProductsModel>?> getProductsOfTheShop(String shopId,String categoryId) async {
    List<ProductsModel>? productsList = [];

    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      "shop":shopId,
      "ctgid":categoryId,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var product in data){
        productsList.add(ProductsModel.fromJson(product));
      }
      return productsList;
    }
    return null;
  }

}