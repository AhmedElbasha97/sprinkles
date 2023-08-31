// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';

class StoreLoadingWidget extends StatelessWidget {
  const StoreLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: Get.height*0.7,
      width: Get.width,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8.0),

          separatorBuilder: (_, __) => const SizedBox(height: 5),
          itemCount:5,
          itemBuilder: (_, index) =>
              Stack(
                  children:[
                    Container(
                      height: Get.height*0.23,
                      width:Get.width*0.9,
                      child:const Padding(padding: EdgeInsets.all(0),
                      ),
                    ),
                    Positioned(
                        top:Get.height*0.005,
                        left:Get.width*0.1,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: Get.height*0.05,
                            width:Get.width*0.725,
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
                        )
                    ),

                    Positioned(
                      left:3,
                      top:3,
                      child:  Container(

                        height: Get.height*0.14,
                        width: Get.width*0.29,
                        decoration:BoxDecoration(
                          color:  const Color(0xFFF2F0F3),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(
                                0.0,
                                0.0,
                              ),
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
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
                            width: Get.width*0.26,
                            decoration:BoxDecoration(
                              color:  const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(50),

                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                              .slide(),
                        ),
                      ),
                    ),
                    Positioned(
                      left: Get.width*0.2,
                      top:Get.height*0.1145,
                      child: Container(
                        height: Get.height*0.025,
                        width:Get.width*0.05,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2F0F3),
                          borderRadius: BorderRadius.circular(50),
                        ),

                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                          .animate() // this wraps the previous Animate in another Animate
                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                          .slide(),
                    ),
                    Positioned(
                      left: Get.width*0.25,
                      top:Get.height*0.09,
                      child: Container(
                          width:Get.width*0.61,
                          height:Get.height*0.12,
                          child:Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              mainAxisAlignment:MainAxisAlignment.spaceBetween,
                              children:[
                                Container(
                                  width:Get.width*0.5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDFDDDF),
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate() // this wraps the previous Animate in another Animate
                                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                    .slide(),

                                Container(
                                  width:Get.width*0.5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDFDDDF),
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate() // this wraps the previous Animate in another Animate
                                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                    .slide(),
                                Container(
                                  width:Get.width*0.5,
                                  height: 15,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFDFDDDF),
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                ).animate(onPlay: (controller) => controller.repeat())
                                    .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                    .animate() // this wraps the previous Animate in another Animate
                                    .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                    .slide(),
                                Row(
                                    children:[
                                      Container(
                                        height: Get.height*0.03,
                                        width: Get.width*0.2,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),
                                      Container(
                                        height: Get.height*0.03,
                                        width: Get.width*0.08,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),Container(
                                        height: Get.height*0.03,
                                        width: Get.width*0.08,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),Container(
                                        height: Get.height*0.03,
                                        width: Get.width*0.2,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFDFDDDF),
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),

                                    ]
                                ),
                              ]
                          )
                      ),
                    ),
                  ]
              ),
      ).animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(85))
          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide(),
    );
  }
}
