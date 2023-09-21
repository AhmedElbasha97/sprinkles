
import 'package:sprinkles/Utils/api_service.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/models/links_model.dart';
import 'package:sprinkles/models/privacy_policy_model.dart';

class AppInfoServices {
  static ApiService api = ApiService();
  Future<PrivacyPolicy?> getPrivacyPolicy() async {
    var data = await api.request(Services.privacyPolicyEndPoint, "POST");
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }

  Future<PrivacyPolicy?> getTermsAndCondition() async {
    var data = await api.request(Services.termsAndConditionEndPoint, "POST");
    if (data != null) {
      return PrivacyPolicy.fromJson(data[0]);
    }
    return null;
  }

  static Future<LinksModel?> getLinks() async {
    var data = await api.request(Services.linksEndPoint, "POST",);
    if (data != null) {
      return LinksModel.fromJson(data[0]);
    }
    return null;
  }

}