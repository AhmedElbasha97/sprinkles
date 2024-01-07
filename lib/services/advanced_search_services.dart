import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/product_pagination_model.dart';
import 'package:sprinkles/models/shops_model.dart';


class AdvancedSearchServices{
  static ApiService api = ApiService();
  static Future<ProductPaginationModel?> searchingForProduct(
      String searchType,
      String mainCategoryId,
      String subCategoryId,
      String rating,
      String priceFrom,
      String priceTo,
      String locationId,
      int pageNumber,
      ) async {

    var data = await api.request(Services.advancedSearchPaginationEndPoint, "POST",queryParamters: {
      "type": "P",
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "review":rating,
      "price_from":priceFrom,
      "price_to":priceTo,
      "area":locationId,
      "member_id": Get.find<StorageService>().getId,
      "page":pageNumber,

    });
    if (data != null) {
      print(data.toString());
      return ProductPaginationModel.fromJson(data);

    }
    return null;
  }
  Future<List<ShopsModel>?> searchingForStore(
      String mainCategoryId,
      String rating,
      String locationId,
      ) async {
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.advancedSearchEndPoint, "POST",queryParamters: {
      "type": "S",
      "ctgid":mainCategoryId,
      "ctgid2":"0",
      "review":rating,
      "price_from":"0",
      "price_to":"0",
      "area":locationId,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      for (var order in data){
        shopList.add(ShopsModel.fromJson(order));
      }
      return shopList;
    }
    return null;
  }
}