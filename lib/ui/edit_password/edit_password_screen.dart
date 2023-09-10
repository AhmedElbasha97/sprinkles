// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/ui/edit_password/controller/edit_password_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:sprinkles/widgets/loading_dialogue.dart';
import 'package:sprinkles/widgets/text_field_widget.dart';

class EditPasswordScreen extends StatelessWidget {
  const EditPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
        backgroundColor:kBackGroundColor,
        body:GetBuilder<EditPasswordController>(
          init: EditPasswordController(),
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
                              width:Get.width*0.6,
                              child:     Padding(
                                padding: const EdgeInsets.fromLTRB(0,0,20.0,0),
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
                                        padding: EdgeInsets.fromLTRB(0,0,15.0,0),
                                        child: Center(
                                          child: CustomText(
                                            'تعديل كلمه السر',
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
                          hasIntialValue: true,
                          labelText:  " كلمة المرور الخاصة بك",
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.visiblePassword,
                          iconOfTextField: const Icon(Icons.password_rounded,
                              color: kDarkPinkColor),
                          hasGreenBorder: false,
                          controller: controller.passwordController,
                          validator: controller.validatePassword,
                          isAutoValidate: true,
                          obsecure: !controller.visiblePsd,
                          icon: IconButton(
                            // Based onble state choose the icon
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
                          labelText:  "تأكيد كلمة المرور الخاصة بك",
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
                      text:   const TextSpan(
                        children: [

                          WidgetSpan(
                            child: Icon(Icons.info_sharp, size: 14,color: kDarkPinkColor,),
                          ),
                          TextSpan(
                            text: "يجب أن يكون كلمه السر تحتوى على حرف كبير و حرف صغير ورموز خاصه مثل :(@,#,!,&,*,~)و رقم وليس أقل من ٨أحرف",
                            style:  TextStyle(
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





                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(
                        controller.changePassword){
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
                        child:  const Center(
                          child:  CustomText("تعديل كلمه السر",
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
