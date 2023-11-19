// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      separatorBuilder: (_, __) => const SizedBox(height: 5),
      itemCount:5,
      itemBuilder: (_, index) =>
          Stack(
              children:[
                Container(
                  height: Get.height*0.145,
                  width:Get.width*0.95,
                  child:const Padding(padding: EdgeInsets.all(0),
                  ),
                ),
                Positioned(
                  bottom:Get.height*0.005,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      height: Get.height*0.09,
                      width:Get.width*0.75,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F0F3),
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
                        borderRadius: BorderRadius.circular(40), //
                      ),
                      child:  Center(
                        child:   Container(
                          width:Get.width*0.25,
                          height: 20,
                          decoration: BoxDecoration(
                              color: const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50)
                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                            .slide(),

                      ),
                    ).animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                        .animate() // this wraps the previous Animate in another Animate
                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                        .slide(),
                  ),
                ),

                Positioned(
                  left:0,
                  child: Container(

                    height: Get.height*0.14,
                    width: Get.width*0.29,
                    decoration:BoxDecoration(
                      color:  const Color(0xFFF2F0F3),
                      shape: BoxShape.circle,
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
                    ),
                    child:Center(
                      child: Container(

                        height: Get.height*0.12,
                        width: Get.width*0.25,
                        decoration:const BoxDecoration(
                          color:  Color(0xFFDFDDDF),
                          shape: BoxShape.circle,

                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                    ),
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                      .animate() // this wraps the previous Animate in another Animate
                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                      .slide(),
                ),
              ]
          ).animate(onPlay: (controller) => controller.repeat())
              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
              .animate() // this wraps the previous Animate in another Animate
              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
              .slide(),
    ).animate(onPlay: (controller) => controller.repeat())
        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(85))
        .animate() // this wraps the previous Animate in another Animate
        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
        .slide();
  }
}
