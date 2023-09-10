import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/product_detailed_model.dart';
import 'package:sprinkles/models/products_model.dart';


class ProductServices {
  static ApiService api = ApiService();
  static Future<List<ProductsModel>?> getProducts(int mainCategoryId,int subCategoryId) async {
    List<ProductsModel>? productsList = [];
    var data = await api.request(Services.productEndPoint, "POST",queryParamters: {
      "ctgid":mainCategoryId,
      "ctgid2":subCategoryId,
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
      "item_id":productId
    });
    if (data != null) {
      return ProductDetailedModel.fromJson(data);
    }
    return null;
  }

}