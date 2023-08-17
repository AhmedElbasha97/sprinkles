import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/shops_model.dart';

import '../models/shop_detailed_model.dart';


class ShopServices {
  static ApiService api = ApiService();
  static Future<List<ShopsModel>?> getShops() async {
    List<ShopsModel>? shopList = [];
    var data = await api.request(Services.shopEndPoint, "POST");
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
      "shop_id":shopId
    });
    if (data != null) {


      return ShopDetailedModel.fromJson(data[0]);
    }
    return null;
  }
}