
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/links_model.dart';

class AppInfoServices {
  static ApiService api = ApiService();
  static Future<LinksModel?> getLinks() async {
    var data = await api.request(Services.linksEndPoint, "POST",);
    if (data != null) {
      return LinksModel.fromJson(data[0]);
    }
    return null;
  }

}