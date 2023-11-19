import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../../Utils/memory.dart';


class DetailsInformationWidget extends StatelessWidget {
  final String Text;
  const DetailsInformationWidget({Key? key, required this.Text,   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Dialog(
          backgroundColor:Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 15),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
          child: SingleChildScrollView(
            child: Container(
              height: Get.height*0.5,
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
                              child: Container(
                                height:Get.height*0.33,
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
                                  child: Container(
                                    height: Get.height*0.2,
                                    decoration: BoxDecoration(
                                      borderRadius:BorderRadius.circular(10),
                                      border: Border.all(color: kDarkPinkColor,width: 1),
                                      color:kBackGroundColor,
                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: CustomText(
                                          Text,
                                          textAlign: TextAlign.center,
                                            style: TextStyle(
                                              shadows: <Shadow>[
                                                Shadow(
                                                    offset: const Offset(0.5, 0.5),
                                                    blurRadius: 0.5,

                                                    color: Colors.black.withOpacity(0.5)
                                                ),
                                              ],
                                              fontSize: 12,
                                              letterSpacing: 0,
                                              fontFamily: Get
                                                  .find<StorageService>()
                                                  .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                              color:Colors.black,
                                            )
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                              ),
                            ),
                          )
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
                              child: Image.asset("assets/icons/information_icon.png",fit: BoxFit.fitHeight,),
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
          ),

    );


  }
}