
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/models/privacy_policy_model.dart';
import 'package:sprinkles/services/app_info_services.dart';

class TermsAndConditionController extends GetxController{
  late PrivacyPolicy? termsData;
  bool loading = true;
  bool isOffline = false;

  final BuildContext context;
  @override
  TermsAndConditionController(this.context);
  @override
  Future<void> onInit() async {

    super.onInit();
    getData();
  }

  getData() async {
    termsData = await AppInfoServices().getTermsAndCondition();
    loading = false;
    update();
  }
}