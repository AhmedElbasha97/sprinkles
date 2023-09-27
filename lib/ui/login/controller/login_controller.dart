// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/Utils/validator.dart';
import 'package:sprinkles/models/user_auth_model.dart';
import 'package:sprinkles/services/auth_services.dart';
import 'package:sprinkles/ui/home_screen/home_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';

class LoginController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;
  RxBool _visiblePsd = false.obs;
  RxBool _isEnableLogin = false.obs;
  bool get isEnableLogin => _isEnableLogin.value;
  bool get visiblePsd => _visiblePsd.value;
  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }
  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;

    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController passwordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool emailState = false;
  bool passHasAnErrorViewed = false;
  bool emailHasAnErrorViewed = false;
  bool signingIn =false;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    checkForUpgrades();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
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

  String? validatePassword(String? password) {
    final validatePassword = _validatorHelber.validatePassword(password);
    if (validatePassword == null) {
      passState = true;

    }else{

    }
    passValidated = true;

    return validatePassword;
  }


  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
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
    signingIn = true;
    update();
    showDialog(context: context,
        builder: (context) {
          return const LoadingDialogue();
        }
    );
    if(emailState){
      UserAuthModel? data = await AuthServices.signingIn(emailController.text, passwordController.text);
      if(data?.msg == "succeeded"){
        await Get.find<StorageService>().saveAccountId("${data?.info?.id??0}");
        await Get.find<StorageService>().saveAccountName(data?.info?.name??"0");
        Get.offAll(const HomeScreen());
      }else{
        signingIn = false;
        update();
        showDialog(context: context,
            builder: (context) {
              return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
            }
        );
      }
    }
  }
  @override
  String toString() {
    return 'LoginController{ _email: ${emailController
        .value}, _password: ${passwordController.value}}';
  }
}