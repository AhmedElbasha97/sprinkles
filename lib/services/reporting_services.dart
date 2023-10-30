import 'package:get/get.dart';
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/response_model.dart';

class ReportingServices{
  static ApiService api = ApiService();
  Future<ResponseModel?> sendingReports(String shopId,String itemId,String title,String text) async {
    var data = await api.request(Services.sendingReportEndPoint, "POST",queryParamters: {
      "member_id": Get.find<StorageService>().getId,
      "shop_id":shopId,
      "item_id":itemId,
      "title":title,
      "details":text,
    });
    if (data != null) {
      return ResponseModel.fromJson(data);
    }
    return null;
  }
}