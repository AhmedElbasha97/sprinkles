import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class LoadingDialogue extends StatelessWidget {
  const LoadingDialogue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0,
      child: Container(
        height:Get.height*0.26,
        color:Colors.transparent,
        child: Stack(

          children: [
            Positioned(
              bottom:0,
              child: Center(
                child:  Container(

                  padding:  EdgeInsets.only(top:Get.height*0.05,left:10,right:10,bottom:10),                    decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    color:kDarkPinkColor
                ),

                  width:Get.width*0.9,
                  child: Container(
                    height:Get.height*0.09,
                    width:Get.width*0.9,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:kBackGroundColor
                    ),
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        CustomText(
                          "تحميل....",
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
                            color: kLightPinkColor,
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),
                      ],
                    ),
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
                      .animate() // this wraps the previous Animate in another Animate
                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                      .slide(),
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
                child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
              ),
            ),
          ],
        ),
      ).animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(30))
          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide(),
    );
  }
}
