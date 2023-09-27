// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/Utils/validator.dart';
import 'package:sprinkles/models/user_auth_model.dart';
import 'package:sprinkles/services/auth_services.dart';
import 'package:sprinkles/ui/profile/profile_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';

class EditPasswordController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;
  RxBool _visiblePsd = false.obs;
  RxBool _isEnableLogin = false.obs;
  bool get isEnableLogin => _isEnableLogin.value;
  bool get visiblePsd => _visiblePsd.value;
  bool changePassword = false ;
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
  late TextEditingController reTypePasswordController;
  bool passValidated = false;
  bool reTypePasswordValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool reTypePasswordState = false;

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    reTypePasswordController = TextEditingController();
  }

  @override
  void onClose() {
    passwordController.dispose();
    reTypePasswordController.dispose();
    super.onClose();
  }

  void clear() {
    passwordController.clear();
    reTypePasswordController.clear();
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
  String? validateReTypePassword(String? password) {
    var validatePassword = _validatorHelber.validatePassword(password);
    if (validatePassword == null) {
      if(passwordController.text != "") {
        if (password == passwordController.text) {
          reTypePasswordState = true;
          reTypePasswordValidated = true;
        } else {
          validatePassword =invalidReTypePassword.tr;
        }
      }else{
        validatePassword = enterPasswordFirst.tr;
      }
    }else{
      reTypePasswordState = false;
      reTypePasswordValidated = false;
    }
    return validatePassword;
  }
  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      changingPassword(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }

  changingPassword(context) async {
    changePassword = true;
    update();
    showDialog(context: context,
        builder: (context) {
          return const LoadingDialogue();
        });
    UserAuthModel? data = await AuthServices.editingMemberPassword(Get
        .find<StorageService>()
        .getId,passwordController.text);
    if(data?.msg == "succeeded"){
      Get.off(const ProfileScreen());
    }else {
      changePassword = false;
      showDialog(context: context,
          builder: (context) {
            return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"", alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
          }
      );
    }
  }
}