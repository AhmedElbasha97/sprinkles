// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/Utils/validator.dart';
import 'package:sprinkles/models/user_auth_model.dart';
import 'package:sprinkles/models/user_data_model.dart';
import 'package:sprinkles/ui/profile/controller/profile_controller.dart';
import 'package:sprinkles/ui/profile/profile_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';

import '../../../services/auth_services.dart';

class EditProfileController extends GetxController{
  final _validatorHelber = ValidatorHelper.instance;
  bool isLoading = false;
  RxBool _visiblePsd = false.obs;
  RxBool _isEnableLogin = false.obs;
  bool get isEnableLogin => _isEnableLogin.value;
  bool get visiblePsd => _visiblePsd.value;
  late UserDataModel? data;
  void toggleVisiblePsd() {
    _visiblePsd.value = !_visiblePsd.value;
    update();
  }
  final gController = Get.put(ProfileController());
  set isEnableLogin(bool value) {
    _isEnableLogin.value = value;
    update();
  }

  final formKey = GlobalKey<FormState>();
  late TextEditingController phoneController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  bool nameValidated = false;
  bool phoneValidated = false;
  bool emailValidated = false;
  bool formValidated = false;
  bool emailState = false;
  bool nameState = false;
  bool phoneState = false;
  bool editProfile = false ;
  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    nameController = TextEditingController();
    phoneController =TextEditingController();
    getData();
  }

  @override
  void onClose() {
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void clear() {
    emailController.clear();
    nameController.clear();
    phoneController.clear();
  }

  getData() async {
    data = await AuthServices.getUserData( Get.find<StorageService>().getId);
    nameController.text = data?.name??"";
    phoneController.text = "${(data?.phone??0)}".substring(3);
    emailController.text = data?.email??"";
    isLoading = false;
    update();
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


  Future<void> sendPressed(context) async {
    formValidated = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (formValidated) {
      sinningUp(context);
    }
  }

  // late String _optCode;
  Future errorDialog(String err) async {
    return Get.defaultDialog(
        title: "error /n tryAgain.tr ",
        titlePadding: const EdgeInsets.symmetric(vertical: 10),
        middleText: err);
  }
  bool checkDataHasBeenChanged(){

    bool firstChecker = false;
    bool secondChecker = false;
    bool thirdChecker = false;
    bool forthChecker = false;
    bool fifthChecker = false;

    if(nameController.text ==data!.name){
      secondChecker = true;
    }
    if(nameController.text == ""){
      secondChecker = true;
    }

    if(phoneController.text == "${data?.phone??0}"){
      forthChecker = true;
    }
    if(emailController.text == data!.email){
      fifthChecker = true;
    }
    if(firstChecker||secondChecker||thirdChecker||forthChecker||fifthChecker){
      return true;
    }
    return false ;
  }
  sinningUp(context) async {
    editProfile = true;
    update();
    showDialog(context: context,
        builder: (context) {
          return const LoadingDialogue();
        });
    if(checkDataHasBeenChanged()){
      if(emailState&&nameState&&phoneState){
        UserAuthModel? data = await AuthServices.editingUserData(
          Get.find<StorageService>().getId,
          nameController.text,
          emailController.text,
          "974${phoneController.text}",

        );
        if(data?.msg == "succeeded"){
          gController.getProfileData();
          Get.off(const ProfileScreen());
        }else{
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
              }
          );
        }
      }
    }
  }

}
