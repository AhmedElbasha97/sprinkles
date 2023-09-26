import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/ordering_model.dart';
class OrderingServices {
  static ApiService api = ApiService();

  static Future<OrderingModel?> orderingProduct(String productId) async {
    var data = await api.request(Services.orderingProductEndPoint, "POST",queryParamters: {
      "item_id":productId,
    });
    if (data != null) {
      return OrderingModel.fromJson(data);
    }
    return null;
  }
}