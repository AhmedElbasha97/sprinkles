import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/services/reviews_services.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import '../../../Utils/localization_services.dart';
import '../../../Utils/translation_key.dart';

class ReviewingController extends GetxController{
  final TextEditingController msgController =  TextEditingController();
  double hospitalReview = 0.0;
  double doctorReview = 0.0;
  bool addingReview = false;
  final  int historyId;

  ReviewingController(this.historyId);
  changeHospitalReview(double hospReview){
    hospitalReview = hospReview;
    update();
  }
  changeDoctorReview(double docReview){
    doctorReview = docReview;
    update();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<ReviewingController>();
  }
addReview(context) async {
  addingReview = true;
  update();
  CoolAlert.show(
    context: context,
    type: CoolAlertType.loading,
  );

    ResponseModel? data = await ReviewsServices().sendingComment("$historyId", msgController.text , "$doctorReview", "$hospitalReview",);
    if(data?.msg == "succeeded"){
      Get.back();
      showDialog(context: context,
          builder: (context) {
            return AlertDialogue(alertTitle: reviewHaasBeenSend.tr,
                alertText: Get
                    .find<StorageService>()
                    .activeLocale == SupportedLocales.english ? data
                    ?.msg ?? "" : data?.msgAr ?? "",
                alertIcon: "assets/icons/okIcon.png",
                containerHeight: Get.height*0.4);
          }
      ).then((value){
        Get.back();
      });
    }else{
      showDialog(context: context,
          builder: (context) {
            return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
          }
      ).then((value){
        Get.back();
      });
    }
}
}