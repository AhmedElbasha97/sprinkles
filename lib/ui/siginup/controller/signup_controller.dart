// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/Utils/validator.dart';
import 'package:sprinkles/models/user_auth_model.dart';
import 'package:sprinkles/services/auth_services.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';

class SignUpController extends GetxController{
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
  late TextEditingController phoneController;
  late TextEditingController nameController;

  late TextEditingController passwordController;
  late TextEditingController reTypePasswordController;
  late TextEditingController emailController;
  bool passValidated = false;
  bool nameValidated = false;
  bool secondNameValidated = false;
  bool lastNameValidated = false;
  bool phoneValidated = false;
  bool reTypePasswordValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool passState = false;
  bool reTypePasswordState = false;
  bool emailState = false;
  bool nameState = false;
  bool secondNameState = false;
  bool lastNameState = false;
  bool phoneState = false;
  bool signingUp = false ;
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    reTypePasswordController = TextEditingController();
    nameController = TextEditingController();
    phoneController =TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    reTypePasswordController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void clear() {
    emailController.clear();
    passwordController.clear();
    reTypePasswordController.clear();
    nameController.clear();
    phoneController.clear();
  }
  void onEmailUpdate(String? value) {
    if(value == "omar.khaled20@yahoo.com"){
      phoneController.clear();
    }
    if (value == "") {
      emailValidated = false;
    }
    update();
  }

  void onNameUpdate(String? value) {
    if (value == "") {
      nameState = false;
    }
    update();
  }
  String? validateName(String? name) {
    var validateName = _validatorHelber.validateName(name);
    if (validateName == null && name != "") {
      nameState = true;
      nameValidated = true;

    } else {
      nameValidated = true;
      nameState = false;
    }
    return validateName;
  }

  void onPhoneNumberUpdate(String? value) {
    if (value == "") {
      phoneState = false;
    }
    update();
  }
  String? validatePhoneNumber(String? phoneNumber) {
    var validateName = _validatorHelber.validatePhoneNumberField(phoneNumber);
    if (validateName == null && phoneNumber != "") {
      phoneState = true;
      phoneValidated = true;

    } else {
      phoneValidated = true;
      phoneState = false;
    }
    return validateName;
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
      signningUp(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }
  signningUp(context) async {
    signingUp = true;
    update();
    showDialog(context: context,
        builder: (context) {
          return const LoadingDialogue();
        }
    );
    if(passState&&emailState&&nameState&&phoneState&&reTypePasswordState){
      UserAuthModel? data = await AuthServices.signingUp(nameController.text,
          emailController.text,
          "974${phoneController.text}",
          passwordController.text,
          reTypePasswordController.text
      );
      if(data?.msg == "succeeded"){
        await Get.find<StorageService>().saveAccountId("${data?.info?.id??0}");
        await Get.find<StorageService>().saveAccountName(data?.info?.name??"0");

        Get.back();
        Get.back();
      }
      else{
        signingUp = false;
        update();
        showDialog(context: context,
          builder: (context) {
            return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
          }
        );
      }
    }
  }

}