// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/government_model.dart';
import 'package:sprinkles/models/product_pagination_model.dart';
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
  static Future<List<GovernmentModel>?> getGovernments() async {
    List<GovernmentModel>? governmentsList = [];
    var data = await api.request(Services.getGovernmentsEndPoint, "POST",);
    if (data != null) {
      for (var government in data){
        governmentsList.add(GovernmentModel.fromJson(government));
      }
      return governmentsList;
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
  static Future<ProductPaginationModel?> searchForProductsInBranchCategory(int mainCategoryId,int subCategoryId,String searchKeyWord,String filterData,int pageNumber) async {
    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productPagenationEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "sort":filterData,
      "page":pageNumber,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      return ProductPaginationModel.fromJson(data);
    }
    return null;
  }
  static Future<ProductPaginationModel?> searchForProductsInMainCategory(int mainCategoryId,String searchKeyWord,String filterData,int pageNumber) async {

    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productPagenationEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,
      "ctgid":mainCategoryId,
      "sort":filterData,
      "page":pageNumber,
      "member_id": Get.find<StorageService>().getId

    });
    if (data != null) {
      return ProductPaginationModel.fromJson(data);
    }
    return null;
  }
  static Future<ProductPaginationModel?> searchForProducts(String searchKeyWord,String filterData,int pageNumber) async {

    String nameParamsTag = "";
    intl.Bidi.detectRtlDirectionality(searchKeyWord)?nameParamsTag = "name":nameParamsTag = "name_en";
    var data = await api.request(Services.productPagenationEndPoint, "POST",queryParamters: {
      nameParamsTag:searchKeyWord,

      "sort":filterData,
      "page":pageNumber,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      return ProductPaginationModel.fromJson(data);
    }
    return null;
  }
}