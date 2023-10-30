import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/order_history_model.dart';

class OrderHistoryServices{
  static ApiService api = ApiService();
  Future<List<OrderHistoryModel>?> getOrdersHistory(String status) async {
    List<OrderHistoryModel>? ordersHistoryList = [];
    var data = await api.request(Services.getOrdersHistoryEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "status":status,
    });
    if (data != null) {
      for (var order in data){
        ordersHistoryList.add(OrderHistoryModel.fromJson(order));
      }
      return ordersHistoryList;
    }
    return null;
  }
}