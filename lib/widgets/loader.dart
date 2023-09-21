import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';


class Loader extends StatelessWidget {
  const Loader({Key? key, this.height=0, this.width=0}) : super(key: key);
final double height;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height==0?MediaQuery.of(context).size.height:height ,
      width: width==0?MediaQuery.of(context).size.width:width ,
      color:const Color(0x80000000),
      child: Center(
        child: Container(
          height: Get.height*0.3,
          width: Get.width*0.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [kDarkPinkColor,kLightPinkColor],
              ),
            border: Border.all(width: 1, color: Colors.white),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5, //soften the shadow
                spreadRadius: 0, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 10  horizontally
                  3.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,height: 150,
                  child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
                ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms, color:  kLightPinkColor)
                .animate() // this wraps the previous Animate in another Animate
                .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                .slide(),
                 const SizedBox(height:10),
                 CustomText(
                  loadingKey.tr,
                  style:  TextStyle(
                    fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyEnglishName:fontFamilyArabicName,
                    color: kDarkPinkColor,
                    fontWeight: FontWeight.w800,
                    fontSize: 15,

                    height: 1,
                    letterSpacing: -1,
                  ),
                ) .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1200.ms, color: kLightPinkColor)
                    .animate() // this wraps the previous Animate in another Animate
                    .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
                    .slide(),
                const SizedBox(height: 10,),

              ],
            ),
          ),
        ).animate(onPlay: (controller) => controller.repeat())

            .animate() // this wraps the previous Animate in another Animate
            .fadeIn(duration: 1200.ms, curve: Curves.easeOutQuad)
            .slide(),
      ),
    ) ;
  }
}
