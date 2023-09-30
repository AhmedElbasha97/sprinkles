
// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/siginup/controller/signup_controller.dart';
import 'package:sprinkles/widgets/text_field_widget.dart';

import '../../Utils/constant.dart';
import '../../widgets/custom_text_widget.dart';
import '../../widgets/loading_dialogue.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
        backgroundColor:kBackGroundColor,
        body:GetBuilder<SignUpController>(
          init: SignUpController(),
          builder: (controller) => SingleChildScrollView(
            child:  Form(
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
                          top:statusBarHeight,
                          right:0,
                          child: Container(
                              height: Get.height*0.25,
                              width:Get.width*0.5,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0,5,10.0,0),
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
                                        padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                        child: Center(
                                          child: CustomText(
                                            signUpProfile.tr,
                                            style: const TextStyle(

                                              fontSize: 22,
                                              letterSpacing: 0,
                                              fontFamily: fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              )),),
                        Positioned(
                          top:statusBarHeight,
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
                  ):Stack(
                      children:[
                        Container(
                          height: Get.height*0.25,
                          width:Get.width,

                        ),
                        Positioned(
                          top:statusBarHeight,
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
                        Positioned(
                          top:statusBarHeight,
                          left:0,
                          child: Container(
                              height: Get.height*0.25,
                              width:Get.width*0.5,
                              child:    Padding(
                                padding: const EdgeInsets.fromLTRB(0,5,10.0,0),
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
                                        padding: const EdgeInsets.fromLTRB(0,0,15.0,0),
                                        child: Center(
                                          child: CustomText(
                                            signUpProfile.tr,
                                            style: const TextStyle(

                                              fontSize: 22,
                                              letterSpacing: 0,
                                              fontFamily: fontFamilyArabicName,
                                              color: kDarkPinkColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]
                                ),
                              )),),


                      ]
                  ),




                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                        textAligning: TextAlign.center,
                        hasIntialValue: true,
                        labelText: signUpTitleName.tr,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        iconOfTextField: const Icon(Icons.person,
                            color: kDarkPinkColor),
                        controller:controller.nameController,
                        onchange: controller.onNameUpdate,
                        validator: controller.validateName,
                        icon: (controller.nameValidated)
                            ? (controller.nameState)
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: Get.height*0.09,
                        width: Get.width*0.95,
                        child: CustomInputField(
                          hasIntialValue: true,
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: Get.height*0.09,
                        width: Get.width*0.95,
                        child: CustomInputField(
                          hasIntialValue: true,
                          labelText: signUpTitlePhone.tr,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          iconOfTextField: const Icon(Icons.phone,
                              color: kDarkPinkColor),
                          controller:controller.phoneController,
                          onchange: controller.onPhoneNumberUpdate,
                          validator: controller.validatePhoneNumber,
                          icon: (controller.phoneValidated)
                              ? (controller.phoneState)
                              ?   Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                              ),),
                              const Icon(Icons.check_rounded,
                                  color: kDarkPinkColor),
                              const SizedBox(width: 5,),
                            ],
                          )
                              :   Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                              ),),
                              const Icon(
                                Icons.close_outlined,
                                color: kErrorColor,
                              ),const SizedBox(width: 5,),
                            ],
                          )
                              :   Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              CustomText("   ${signUpTextPhoneKey.tr}    ", style: const TextStyle(
                                fontSize: 15.0,
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                              ),),
                            ],
                          ),
                          hasGreenBorder: false,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: Get.height*0.09,
                        width: Get.width*0.95,
                        child: CustomInputField(
                            hasIntialValue: true,
                            labelText: signUpTitlePass.tr,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                            iconOfTextField: const Icon(Icons.password,
                                color: kDarkPinkColor),
                            hasGreenBorder: false,
                            controller: controller.passwordController,
                            validator: controller.validatePassword,
                            isAutoValidate: true,
                            obsecure: !controller.visiblePsd,
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: SizedBox(
                        height: Get.height*0.09,
                        width: Get.width*0.95,
                        child: CustomInputField(
                            hasIntialValue: true,
                            labelText:  signUpTitleConfirmPass.tr,
                            iconOfTextField: const Icon(Icons.password,
                                color: kDarkPinkColor),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                            hasGreenBorder: false,

                            controller: controller.reTypePasswordController,
                            validator: controller.validateReTypePassword,
                            isAutoValidate: true,
                            obsecure: !controller.visiblePsd,
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: RichText(
                        text:    TextSpan(
                          children: [

                            const WidgetSpan(
                              child: Icon(Icons.info_sharp, size: 14,color: kDarkPinkColor,),
                            ),
                            TextSpan(
                              text: changePassScreenText3.tr,
                              style:  const TextStyle(
                                  fontSize: 12.0,
                                  fontFamily: fontFamilyArabicName,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkPinkColor
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:   [
                         CustomText(signUpText1.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily:fontFamilyArabicName,
                              color: kLightPinkColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),),
                        const SizedBox(width: 5,),
                        InkWell(
                          onTap: (){
                            Get.to( LoginScreen());
                          },
                          child:   CustomText(signInBTN.tr,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: fontFamilyArabicName,
                                color: kDarkPinkColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 15),),
                        ),




                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),





                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(
                        controller.signingUp){
                          showDialog(context: context,
                              builder: (context) {
                            return const LoadingDialogue();
                          }
                          );
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
                          child:  CustomText(signUpProfile.tr,
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
          ),
        )
    );
  }
}
