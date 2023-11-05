import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/main_category_data.dart';
import 'package:sprinkles/models/product_detailed_model.dart';
import 'package:sprinkles/models/products_model.dart';


class ProductServices {
  static ApiService api = ApiService();
  static Future<MainCategoryTapModel?> getMainProductData(String ctgId) async {

    var data = await api.request(Services.mainCategoryDataProductEndPoint, "POST",queryParamters: {
      "ctgid":ctgId,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      return MainCategoryTapModel.fromJson(data[0]);
    }
    return null;
  }
  static Future<List<ProductsModel>?> getAllProduct(String filterData) async {
    List<ProductsModel>? productsList = [];
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
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
  static Future<List<ProductsModel>?> getProducts(int mainCategoryId,int subCategoryId,String filterData) async {
    List<ProductsModel>? productsList = [];
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
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
  static Future<ProductDetailedModel?> getProductDetails(String productId) async {
    var data = await api.request(Services.productDetailedEndPoint, "POST",queryParamters: {
      "item_id":productId,
      "member_id": Get.find<StorageService>().getId
    });
    if (data != null) {
      return ProductDetailedModel.fromJson(data);
    }
    return null;
  }
  static Future<List<ProductsModel>?> getProductsSimilarToProductDetailedShown(int mainCategoryId,int subCategoryId,String shopId) async {
    List<ProductsModel>? productsList = [];
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
      "shop":shopId,
      "member_id": Get.find<StorageService>().getId,
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