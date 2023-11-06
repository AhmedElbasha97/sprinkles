// ignore_for_file: sized_box_for_whitespace


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/forgetPassword/controller/forget_password_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';
import 'package:sprinkles/widgets/text_field_widget.dart';

class ForgettingPasswordScreen extends StatelessWidget {
  const ForgettingPasswordScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        backgroundColor:kBackGroundColor,
        body:GetBuilder<ForgetPasswordController>(
          init: ForgetPasswordController(),
          builder: (controller) => SingleChildScrollView(
            child:  Form(
              key:controller.formKey,
              child: Column(

                children:[
                  Get.find<StorageService>().activeLocale == SupportedLocales.english?
                  Stack(
                      children:[
                        Container(
                          height: Get.height*0.25,
                          width:Get.width,

                        ),
                        Positioned(
                          top:statusBarHeight-5,
                          right:0,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height*0.19,
                                width: Get.width*0.47,
                              ),
                              Positioned(
                                top:0,
                                child: SizedBox(
                                  height: Get.height*0.19,
                                  width: Get.width*0.47,
                                  child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.fitWidth,),
                                ),
                              ),
                              Positioned(
                                top:5,
                                right:5,
                                child: Container(
                                  width:Get.width*0.26,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: Get.height*0.14,
                                        width: Get.width*0.26,
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitWidth,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top:statusBarHeight-5,
                          left:0,
                          child: Container(
                              height: Get.height*0.25,
                              width:Get.width*0.5,
                              child:     Padding(
                                padding: const EdgeInsets.fromLTRB(10.0,10,10.0,0),
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,

                                    children:[
                                      InkWell(
                                        onTap:(){
                                          Get.back();
                                        },
                                        child: Container(
                                          child: const Row(
                                              children:[
                                                Icon(
                                                    Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                                                ),
                                              ]
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width:10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10.0,10,10.0,0),
                                        child: CustomText(
                                          greetingText.tr,
                                          style:  TextStyle(
                                            fontWeight: FontWeight.w900,

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(17.0,0,7.0,0),
                                        child: Center(
                                          child: CustomText(
                                            forgetPassTitle.tr,
                                            style:  TextStyle(

                                              fontSize: 22,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              )),),


                      ]
                  ):
                  Stack(
                      children:[
                        Container(
                          height: Get.height*0.25,
                          width:Get.width,

                        ),
                        Positioned(
                          top:statusBarHeight-5,
                          right:0,
                          child: Container(
                              height: Get.height*0.25,
                              width:Get.width*0.65,
                              child:     Padding(
                                padding: const EdgeInsets.fromLTRB(0,10,10.0,0),
                                child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,

                                    children:[
                                      InkWell(
                                        onTap:(){
                                          Get.back();
                                        },
                                        child: Container(
                                          child: const Row(
                                              children:[
                                                Icon(
                                                    Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:20
                                                ),
                                              ]
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width:10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,10.0,0),
                                        child: CustomText(
                                          greetingText.tr,
                                          style:  TextStyle(
                                            fontWeight: FontWeight.w900,

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: Get
                                                .find<StorageService>()
                                                .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(0,0,7.0,0),
                                        child: Center(
                                          child: CustomText(
                                            forgetPassTitle.tr,
                                            style:  TextStyle(

                                              fontSize: 22,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              )),),
                        Positioned(
                          top:statusBarHeight-5,
                          left:0,
                          child: Stack(
                            children: [
                              Container(
                                height: Get.height*0.19,
                                width: Get.width*0.47,
                              ),
                              Positioned(
                                top:0,
                                child: SizedBox(
                                  height: Get.height*0.19,
                                  width: Get.width*0.47,
                                  child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitWidth,),
                                ),
                              ),
                              Positioned(
                                top:5,
                                left:5,
                                child: Container(
                                  width:Get.width*0.26,
                                  child: Row(
                                    mainAxisAlignment:MainAxisAlignment.start,
                                    crossAxisAlignment:CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: Get.height*0.14,
                                        width: Get.width*0.26,
                                        child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitWidth,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ]
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.9,
                      child: CustomInputField(
                        hasIntialValue: true,
                        textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,
                        labelText: signUpTitleEmail.tr,
                        iconOfTextField: const Icon(Icons.email,
                            color: kDarkPinkColor),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,

                        controller:controller.emailController,
                        onchange: controller.onEmailUpdate,
                        validator: controller.validateEmail,
                        icon: (controller.emailValidated)
                            ? (controller.emailState)
                            ? const Icon(Icons.check_rounded,
                            color: kDarkPinkColor)
                            : const Icon(
                          Icons.close_outlined,
                          color: kErrorColor,
                        )
                            : null,
                        hasGreenBorder: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),






                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: InkWell(
                      onTap: (){
                        if(
                        controller.forgettingPassword){
                          showDialog(context: context,
                              builder: (context) {
                                return const LoadingDialogue();
                              });
                        }else{
                          controller.sendPressed(context);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: Get.width*0.6,
                        decoration: BoxDecoration(
                          border: Border.all( color:Colors.white,width: 2),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                              blurRadius: 13.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [kDarkPinkColor,kLightPinkColor],
                          ),borderRadius: BorderRadius.circular(40), //
                        ),
                        child:   Center(
                          child:  CustomText(forgetPassTitle.tr,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                                fontFamily:Get
                                    .find<StorageService>()
                                    .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 22),),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}