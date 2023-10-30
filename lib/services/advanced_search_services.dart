import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/shops_model.dart';


class AdvancedSearchServices{
  static ApiService api = ApiService();
  Future<List<ProductsModel>?> searchingForProduct(
      String searchType,
      String mainCategoryId,
      String subCategoryId,
      String rating,
      String priceFrom,
      String priceTo,
      ) async {
    List<ProductsModel>? productsList = [];
    var data = await api.request(Services.advancedSearchEndPoint, "POST",queryParamters: {
      "type": "p",
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "review":rating,
      "price_from":priceFrom,
      "price_to":priceTo,
    });
    if (data != null) {
      for (var order in data){
        productsList.add(ProductsModel.fromJson(order));
      }
      return productsList;
    }
    return null;
  }
  Future<List<ShopsModel>?> searchingForStore(
      String searchType,
      String mainCategoryId,
      String subCategoryId,
      String rating,
      String priceFrom,
      String priceTo,
      ) async {
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.advancedSearchEndPoint, "POST",queryParamters: {
      "type": "s",
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "review":rating,
      "price_from":priceFrom,
      "price_to":priceTo,
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