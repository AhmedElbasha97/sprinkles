import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:get/get.dart';
import 'package:sprinkles/ui/product_detailed_screen/product_detailed_screen.dart';
import 'package:sprinkles/ui/store_details_screen/store_details_screen.dart';

class DynamicLinkHandler {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  Future<void> initDynamicLinks() async {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      // Listen and retrieve dynamic links here
      final String deepLink = dynamicLinkData.link.toString(); // Get DEEP LINK
      final String path = dynamicLinkData.link.path; // Get PATH


      if(deepLink.isEmpty)  return;
      handleDeepLink(path.toString());
    }).onError((error) {
      print('onLink error');
      print(error.message);
    });
    initUniLinks();
  }
  Future<void> initUniLinks() async {
    try {
      final initialLink = await dynamicLinks.getInitialLink();
      if(initialLink == null)  return;
      handleDeepLink(initialLink.link.path);
    } catch (e) {
      // Error
    }
  }
  void handleDeepLink(String path) {

    var pos = path.lastIndexOf('_');
    String result = (pos != -1)? path.substring(0, pos): path;
    print(result.contains("s"));
    var aStr = result.replaceAll(new RegExp(r'[^0-9]'),''); // '23'
    var aInt = int.parse(aStr);
    print(aInt);
    if(result.contains("s")){
      Get.to(()=>StoreDetailedScreen(shopId: "${aInt}", mainCategoryId: 1, mainCategoryImg: '',));

    }else{
      Get.to(()=>ProductDetailedScreen(productId: "${aInt}", mainCategoryId: 1, comingFromProductList: false, comingFromFavoriteList: false, comingFromProductDetails: false, branchCategoryId: 2, mainCategoryImg: ""));

    }
  }
}
