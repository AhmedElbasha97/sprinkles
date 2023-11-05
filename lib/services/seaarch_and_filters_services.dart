// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/shops_model.dart';
import 'package:intl/intl.dart' as intl;
class SearchAndFilterServices {
  static ApiService api = ApiService();
  static Future<List<ShopsModel>?> searchForShopInMainCategory(int mainCategoryId,String searchKeyWord,String filterData) async {
   String nameParamsTag = "";
     intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.shopEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
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
  static Future<List<ShopsModel>?> searchForShop(String searchKeyWord,String filterData) async {
   String nameParamsTag = "";
     intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.shopEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
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
  static Future<List<ProductsModel>?> searchForProductsInBranchCategory(int mainCategoryId,int subCategoryId,String searchKeyWord,String filterData) async {
    List<ProductsModel>? productsList = [];
    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "sort":filterData,
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
  static Future<List<ProductsModel>?> searchForProductsInMainCategory(int mainCategoryId,String searchKeyWord,String filterData) async {
    List<ProductsModel>? productsList = [];
    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
      "ctgid":mainCategoryId,
      "sort":filterData,
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
  static Future<List<ProductsModel>?> searchForProducts(String searchKeyWord,String filterData) async {
    List<ProductsModel>? productsList = [];
    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
      "sort":filterData,
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