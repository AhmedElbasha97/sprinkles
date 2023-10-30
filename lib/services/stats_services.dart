import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/response_model.dart';

class StatsServices{
  static ApiService api = ApiService();
  Future<ResponseModel?> sendingOrderNowOrWhatsAppOrCallHasBeenClicked(String shopId,String itemId,String orderType,String msg) async {
    var data = await api.request(Services.statsEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "shop_id":shopId,
      "item_id":itemId,
      "order_type":orderType,
      "msg":msg,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}