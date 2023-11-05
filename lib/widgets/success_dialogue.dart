// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class SuccessDialogue extends StatelessWidget {
    const SuccessDialogue({Key? key, required this.successText, required this.successFunction,  this.containerHeight=0}) : super(key: key);
  final String successText;
  final Function successFunction;
  final double? containerHeight;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Container(
        height:containerHeight==0?Get.height*0.19+Get.height*0.12:containerHeight??0+Get.height*0.12,
        color:Colors.transparent,

        child: Center(
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                bottom:0,
                child: Center(
                  child:  Container(

                      padding:  EdgeInsets.only(top:Get.height*0.1,left:0,right:0,bottom:0),                      decoration: BoxDecoration(
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
                                    successText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(

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
                                  successFunction();

                                },
                                child: Stack(
                                    children:[
                                      Container(
                                        height: Get.height*0.1,
                                        width:Get.width*0.55,
                                        child:const Padding(padding: EdgeInsets.all(0),
                                        ),
                                      ),
                                      Positioned(
                                        top:Get.height*0.025,
                                        child: Padding(
                                          padding:  EdgeInsets.symmetric(horizontal: Get.width*0.12),
                                          child: Container(
                                            height: Get.height*0.05,
                                            width:Get.width*0.4,
                                            decoration: BoxDecoration(
                                              border: Border.all( color:kBackGroundColor,width: 2),


                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
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
                                                width:Get.width*0.7,
                                                child: CustomText(
                                                  "حسنآ",
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
                                          child: Image.asset("assets/icons/okIcon.png",fit: BoxFit.fitHeight,),
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),

                ),
              ),
              Positioned(
                top:0,
                child: Container(
                  width:Get.width*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(

                        padding:const EdgeInsets.all(2),
                        decoration: const BoxDecoration(

                            shape: BoxShape.circle,color:kDarkPinkColor
                        ),
                        height: Get.height*0.15,
                        width: Get.width*0.3,
                        child: Image.asset("assets/icons/succesIcon.png",fit: BoxFit.fitHeight,),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat())

          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide(),
    );
  }
}
