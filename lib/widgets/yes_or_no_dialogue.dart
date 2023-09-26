// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class YesOrNoDialogue extends StatelessWidget {
  const YesOrNoDialogue({Key? key, required this.alertTitle, required this.alertText, required this.alertYesButtonTitle, required this.alertNoButtonTitle, required this.alertYesButtonWidth, required this.alertNoButtonWidth, required this.alertYesButtonFunction, required this.alertNoButtonFunction, required this.alertYesButtonIcon, required this.alertNoButtonIcon, required this.alertIcon, this.containerHeight=0}) : super(key: key);
  final String alertTitle;
  final String alertText;
  final String alertYesButtonTitle;
  final String alertNoButtonTitle;
  final String alertYesButtonIcon;
  final String alertNoButtonIcon;
  final double alertYesButtonWidth;
  final double alertNoButtonWidth;
  final Function alertYesButtonFunction;
  final Function alertNoButtonFunction;
  final String alertIcon;
  final double? containerHeight;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor:Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,

      child: Container(
        height:containerHeight==0?Get.height*0.455:containerHeight??0+Get.height*0.14,
        color:Colors.transparent,

        child: Center(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                bottom:0,
                child: Center(
                  child:  Container(

                      padding:  EdgeInsets.only(top:Get.height*0.1,left:0,right:0,bottom:0),
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:kDarkPinkColor,
                        boxShadow: [
                          BoxShadow(
                            color:  Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(6, 5), // Shadow position
                          ),
                        ],
                      ),

                      width:Get.width*0.9,
                      child: Container(

                        width:Get.width*0.85,
                        decoration: BoxDecoration(
                          borderRadius:BorderRadius.circular(10),
                          color:kBackGroundColor,
                          boxShadow: [
                            BoxShadow(
                              color:  Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(6, 5), // Shadow position
                            ),
                          ],
                        ),
                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Center(
                                child:  Container(
                                  width:Get.width*0.7,
                                  child: CustomText(
                                    alertTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kBackGroundColor,
                                    ),
                                  ),
                                ),

                              ),
                              Center(
                                child:  Container(
                                  width:Get.width*0.7,
                                  child: CustomText(
                                    alertText,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                            offset: const Offset(2.0, 2.0),
                                            blurRadius: 13.0,

                                            color: Colors.black.withOpacity(0.5)
                                        ),
                                      ],
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontFamily: fontFamilyArabicName,
                                      color: kDarkPinkColor,
                                    ),
                                  ),
                                ),

                              ),
                              InkWell(
                                onTap:(){
                                  alertYesButtonFunction();
                                },
                                child: Stack(
                                    children:[
                                      Container(
                                        height: Get.height*0.1,
                                        width:alertYesButtonWidth + Get.width*0.12,
                                        child:const Padding(padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                      Positioned(
                                        top:Get.height*0.025,
                                        child: Padding(
                                          padding:  EdgeInsets.only(right: Get.width*0.12),
                                          child: Container(
                                            height: Get.height*0.05,
                                            width:alertYesButtonWidth,
                                            decoration: BoxDecoration(
                                              border: Border.all( color:kBackGroundColor,width: 2),
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
                                            child:  Center(
                                              child:  Container(
                                                child: CustomText(
                                                  alertYesButtonTitle,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                          offset: const Offset(2.0, 2.0),
                                                          blurRadius: 13.0,

                                                          color: Colors.black.withOpacity(0.5)
                                                      ),
                                                    ],
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontFamily: fontFamilyArabicName,
                                                    color: kBackGroundColor,
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        right:0,
                                        child: SizedBox(
                                          height: Get.height*0.1,
                                          width: Get.width*0.2,
                                          child: Image.asset(alertYesButtonIcon,fit: BoxFit.fitHeight,),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              InkWell(
                                onTap:(){
                                  alertNoButtonFunction();
                                },
                                child: Stack(
                                    children:[
                                      Container(
                                        height: Get.height*0.1,
                                        width:alertNoButtonWidth+Get.width*0.12,
                                        child:const Padding(padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                      Positioned(
                                        top:Get.height*0.025,
                                        child: Padding(
                                          padding:  EdgeInsets.only(right: Get.width*0.12),
                                          child: Container(
                                            height: Get.height*0.05,
                                            width:alertNoButtonWidth,
                                            decoration: BoxDecoration(
                                              border: Border.all( color:kBackGroundColor,width: 2),
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
                                            child:  Center(
                                              child:  Container(
                                                child: CustomText(
                                                  alertNoButtonTitle,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    shadows: <Shadow>[
                                                      Shadow(
                                                          offset: const Offset(2.0, 2.0),
                                                          blurRadius: 13.0,

                                                          color: Colors.black.withOpacity(0.5)
                                                      ),
                                                    ],
                                                    fontSize: 18,
                                                    letterSpacing: 0,
                                                    fontFamily: fontFamilyArabicName,
                                                    color: kBackGroundColor,
                                                  ),
                                                ),
                                              ),

                                            ),
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        right:0,
                                        child: SizedBox(
                                          height: Get.height*0.1,
                                          width: Get.width*0.2,
                                          child: Image.asset(alertNoButtonIcon,fit: BoxFit.fitHeight,),
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ),

                ),
              ),
              Positioned(
                top:0,
                left:Get.width*0.3,
                child: Container(

                  padding:const EdgeInsets.all(2),
                  decoration: BoxDecoration(

                      borderRadius:BorderRadius.circular(50),color:kDarkPinkColor
                  ),
                  height: Get.height*0.15,
                  width: Get.width*0.3,
                  child: Image.asset(alertIcon,fit: BoxFit.fitHeight,),
                ),
              ),

            ],
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat())

          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide()
    );
  }
}