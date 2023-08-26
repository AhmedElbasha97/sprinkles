import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/advertisment_model.dart';
import 'package:sprinkles/models/shops_model.dart';

import '../models/shop_detailed_model.dart';


class AdvertismentServices {
  static ApiService api = ApiService();
  static Future<List<AdvertismentModel>?> getAdvertisments(int categoryId) async {
    List<AdvertismentModel>? advertList = [];
    var data = await api.request(Services.advertismentEndPoint, "POST",queryParamters: {
    "ctg_id":categoryId
    });
    if (data != null) {
      for (var advrtisment in data){
        advertList.add(AdvertismentModel.fromJson(advrtisment));
      }
      return advertList;
    }
    return null;
  }
  static void advertismentHasBeenViewed(String sliderId) async {
    var data = await api.request(Services.advertismentHasBeenUsedEndPoint, "POST",queryParamters: {
      "slider_id":sliderId
    });

    return null;
  }
}