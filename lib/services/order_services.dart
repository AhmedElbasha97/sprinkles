import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/response_model.dart';
class OrderingServices {
  static ApiService api = ApiService();

  static Future<ResponseModel?> orderingProduct(String shopId,String productId,String msgText) async {
    var data = await api.request(Services.orderingProductEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "shop_id":shopId,
      "item_id":shopId,
      "msg":msgText
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}