// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class DrawerTapWidget extends StatelessWidget {
  final String title;
  final String iconPath;

  const DrawerTapWidget({super.key, required this.title, required this.iconPath});
  @override
  Widget build(BuildContext context) {
    return    InkWell(
      onTap:(){

      },
      child: Stack(
          children:[
            Container(
              height: Get.height*0.11,
              width:Get.width*0.75,
              child:const Padding(padding: EdgeInsets.all(0),
              ),
            ),
            Positioned(
              top:Get.height*0.025,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: Get.width*0.12),
                child: Container(
                  height: Get.height*0.05,
                  width:Get.width*0.6,
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
                      width:Get.width*0.7,
                      child: CustomText(
                         title,
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
                child: Image.asset(iconPath,fit: BoxFit.fitHeight,),
              ),
            ),
          ]
      ),
    );
  }
}