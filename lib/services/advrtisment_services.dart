// ignore_for_file: unused_local_variable

import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/advertisment_model.dart';



class AdvertisementServices {
  static ApiService api = ApiService();
  static Future<List<AdvertisementModel>?> getAdvertisements(int categoryId) async {
    List<AdvertisementModel>? advertList = [];
    var data = await api.request(Services.advertismentEndPoint, "POST",queryParamters: {
    "ctg_id":categoryId
    });
    if (data != null) {
      for (var advrtisment in data){
        advertList.add(AdvertisementModel.fromJson(advrtisment));
      }
      return advertList;
    }
    return null;
  }
  static Future<void>  advertisementsHasBeenViewed(String sliderId) async {
    var data = await api.request(Services.advertismentHasBeenUsedEndPoint, "POST",queryParamters: {
      "slider_id":sliderId
    });

    return;
  }
}