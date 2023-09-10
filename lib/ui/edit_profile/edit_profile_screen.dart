// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/ui/edit_profile/controller/edit_profile_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';
import 'package:sprinkles/widgets/text_field_widget.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
        backgroundColor:kBackGroundColor,
        body:GetBuilder<EditProfileController>(
          init: EditProfileController(),
          builder: (controller) => SingleChildScrollView(
            child:  Form(
              key:controller.formKey,
              child: Column(

                children:[
                  Stack(
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
                              child:     Padding(
                                padding: EdgeInsets.fromLTRB(0,5,10.0,0),
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
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,10.0,0),
                                        child: CustomText(
                                          'مرحبًا',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,

                                            fontSize: 25,
                                            letterSpacing: 0,
                                            fontFamily: fontFamilyArabicName,
                                            color: kDarkPinkColor,
                                          ),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(0,0,7.0,0),
                                        child: Center(
                                          child: CustomText(
                                            'تعديل حساب',
                                            style: TextStyle(

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
                  ),




                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: SizedBox(
                      height: Get.height*0.09,
                      width: Get.width*0.95,
                      child: CustomInputField(
                        textAligning: TextAlign.center,
                        hasIntialValue: true,
                        labelText: "أدخل اسمك الكامل",
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
                        labelText: "أدخل بريدك الإلكتروني",
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
                        labelText: "أدخل رقم هاتفك",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        iconOfTextField: const Icon(Icons.phone,
                            color: kDarkPinkColor),
                        controller:controller.phoneController,
                        onchange: controller.onPhoneNumberUpdate,
                        validator: controller.validatePhoneNumber,
                        icon: (controller.phoneValidated)
                            ? (controller.phoneState)
                            ?  const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            CustomText("   974    ", style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: fontFamilyArabicName,
                              color: kDarkPinkColor,
                            ),),
                            Icon(Icons.check_rounded,
                                color: kDarkPinkColor),
                            SizedBox(width: 5,),
                          ],
                        )
                            :  const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            CustomText("   974    ", style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: fontFamilyArabicName,
                              color: kDarkPinkColor,
                            ),),
                            Icon(
                              Icons.close_outlined,
                              color: kErrorColor,
                            ),SizedBox(width: 5,),
                          ],
                        )
                            :  const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [

                            CustomText("   974    ", style: TextStyle(
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




                  const SizedBox(height: 10,),






                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(!controller.editProfile) {
                          controller.sinningUp(context);
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
                        child:  const Center(
                          child:  CustomText("تعديل الحساب",
                            textAlign: TextAlign.center,
                            style: TextStyle(
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
