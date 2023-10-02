
// ignore_for_file: sized_box_for_whitespace, unnecessary_import, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/ui/login/controller/login_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';
import 'package:sprinkles/widgets/text_field_widget.dart';

import '../../Utils/localization_services.dart';
import '../../Utils/translation_key.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
          backgroundColor:kBackGroundColor,
        body:SingleChildScrollView(
          child: Form(
            key:controller.formKey,
            child: Column(

              children:[
                Get.find<StorageService>().activeLocale == SupportedLocales.english?Stack(
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
                            child: Image.asset("assets/images/cakeBG1.png",fit: BoxFit.fitHeight,),
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
                                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
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
                    left:10,
                    child: Container(
                        height: Get.height*0.25,
                        width:Get.width*0.5,
                        child:   Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,0,0),
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
                                  padding: const EdgeInsets.fromLTRB(15.0,10.0,10.0,0),
                                  child: CustomText(
                                    greetingText.tr,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,

                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(23.0,0,0.0,0),
                                  child: CustomText(
                                    signInBTN.tr,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                ),
                              ]
                          ),
                        )),),


                ]
            ) :
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
                          width:Get.width*0.5,
                          child:   Padding(
                            padding: const EdgeInsets.fromLTRB(0,10,10.0,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,


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
                                    padding: const EdgeInsets.fromLTRB(0,0,5.0,0),
                                    child: CustomText(
                                      greetingText.tr,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w900,

                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                      ),
                                    ),
                                  ),
                                   Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,10.0,0),
                                    child: CustomText(
                                      signInBTN.tr,
                                      style: const TextStyle(

                                        fontSize: 22,
                                        letterSpacing: 0,
                                        fontFamily: fontFamilyArabicName,
                                        color: kDarkPinkColor,
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
                                child: Image.asset("assets/images/cakeBG.png",fit: BoxFit.fitHeight,),
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
                                      child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
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
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: SizedBox(
                    height: 80,
                    child: CustomInputField(
                      iconOfTextField: const Icon(Icons.email,
                          color: kDarkPinkColor),
                      hasIntialValue: false,
                      textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,

                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
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
                          : const SizedBox(width: 10,),
                      labelText:signUpTitleEmail.tr,

                      hasGreenBorder: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                  child: SizedBox(
                    height:  80,
                    child: CustomInputField(
                        hasIntialValue: false,
                        textAligning: Get.find<StorageService>().activeLocale == SupportedLocales.english?TextAlign.left:TextAlign.right,

                        iconOfTextField: const Icon(Icons.password,
                            color: kDarkPinkColor),
                        hasGreenBorder: true,
                        labelText: signUpTitlePass.tr,
                        controller: controller.passwordController,
                        validator: controller.validatePassword,
                        isAutoValidate: true,
                        obsecure: !controller.visiblePsd,
                        keyboardType: TextInputType.visiblePassword,
                        icon: IconButton(
                          // Based on passwordVisible state choose the icon
                          icon: Icon(
                            controller.visiblePsd
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: kDarkPinkColor,
                          ),
                          onPressed: () {
                            controller.toggleVisiblePsd();
                          },
                        )

                    ),
                  ),
                ),
                const SizedBox(height: 60),
                InkWell(
                  onTap: (){

                  },
                  child:   Text(signInTextForgetPass.tr ,
                    style: const TextStyle(
                        fontFamily: fontFamilyArabicName,
                        color: kDarkPinkColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      if(!controller.signingIn) {
                        controller.sinningIn(context);
                      }else{
                        showDialog(context: context,
                            builder: (context) {
                          return const LoadingDialogue();
                        });
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
                        child:  CustomText(signInBTN.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily:fontFamilyArabicName,
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
        )
      ),
    );
  }
}
