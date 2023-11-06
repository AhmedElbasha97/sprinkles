// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/Utils/validator.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';

import '../../../services/auth_services.dart';

const wrongCode = 'assets/images/wrong_code.png';

class ForgetPasswordController extends GetxController {
  final _validatorHelber = ValidatorHelper.instance;


  final formKey = GlobalKey<FormState>();

  late TextEditingController emailController;

  bool emailValidated = false;
  bool formValidated = false;
  bool emailState = false;
  bool emailHasAnErrorViewed = false;
  bool forgettingPassword =false;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    checkForUpgrades();
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
  @override
  void dispose(){
    super.dispose();
    Get.delete<ForgetPasswordController>();
  }
  void clear() {
    emailController.clear();
  }

  checkForUpgrades() {
    InAppUpdate.checkForUpdate().then((updateInfo) {
      if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
        if (updateInfo.immediateUpdateAllowed) {
          // Perform immediate update
          InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
            }
          });
        } else if (updateInfo.flexibleUpdateAllowed) {
          //Perform flexible update
          InAppUpdate.startFlexibleUpdate().then((appUpdateResult) {
            if (appUpdateResult == AppUpdateResult.success) {
              //App Update successful
              InAppUpdate.completeFlexibleUpdate();
            }
          });
        }
      }
    });
  }


  void onEmailUpdate(String? value) {
    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  String? validateEmail(String? email) {
    final validateEmail = _validatorHelber.validateEmail(email);
    if (email == "") {
      emailState = false;
      emailValidated = false;

    } else if (validateEmail == null) {
      emailState = true;
      emailValidated = true;


    } else {
      emailValidated = true;
      emailState = false;
    }

    return validateEmail;
  }

  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      await sinningIn(context);
    }
  }


  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }


  sinningIn(context) async {
    forgettingPassword = true;
    update();
    showDialog(context: context,
        builder: (context) {
          return const LoadingDialogue();
        });
    if(emailState){
      ResponseModel? data = await AuthServices.forgetPassword(emailController.text);
      if(data?.msg == "succeeded"){
        Get.back();
      }else{

        showDialog(context: context,
            builder: (context) {
              return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:  Get.height*0.4);
            }
        );
      }
    }
  }



}