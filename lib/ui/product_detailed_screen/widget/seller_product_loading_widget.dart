// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';

class SellerProductLoadingWidget extends StatelessWidget {
  const SellerProductLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width:Get.width*0.95,
      height:Get.height*0.35,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        shrinkWrap:true,
        itemCount:30,
        itemBuilder: (BuildContext context, int index) {
          return   Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width:Get.width*0.44,
                height:Get.height*0.31,
                decoration: BoxDecoration(
                  color:Colors.white,
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
                  borderRadius: BorderRadius.circular(15),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      children:[
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                  width:Get.width*0.4,
                                  height:Get.height*0.16,
                                  color: const Color(0xFFDFDDDF)
                              ),
                            ).animate(onPlay: (controller) => controller.repeat())
                                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(55))
                                .animate() // this wraps the previous Animate in another Animate
                                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                .slide(),
                            Positioned(
                              right:5,
                              top:5,
                              child: Container(
                                height: Get.height*0.03,
                                width:Get.width*0.06,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF2F0F3),
                                  borderRadius: BorderRadius.circular(50),
                                ),

                              ).animate(onPlay: (controller) => controller.repeat())
                                  .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(55))
                                  .animate() // this wraps the previous Animate in another Animate
                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                  .slide(),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                              Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width:Get.width*0.1,
                                    height: 13,
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
                                    width:Get.width*0.18,
                                    height: 13,
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
                                    width:Get.width*0.18,
                                    height: 13,
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
                                    width:Get.width*0.23,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50)
                                    ),
                                  ).animate(onPlay: (controller) => controller.repeat())
                                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                      .animate() // this wraps the previous Animate in another Animate
                                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                      .slide(),

                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: Get.height*0.03,
                                      width: Get.width*0.06,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                    Container(
                                      height: Get.height*0.03,
                                      width: Get.width*0.06,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                    Container(
                                      height: Get.height*0.03,
                                      width: Get.width*0.06,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),

                                  ],
                                ),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                            children:[
                              Container(
                                width:Get.width*0.18,
                                height:Get.height*0.028,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDFDDDF),
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:  Center(
                                  child:   Container(
                                    width:Get.width*0.1,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF2F0F3),
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

                              Container(
                                width:Get.width*0.18,
                                height:Get.height*0.028,
                                decoration: BoxDecoration(
                                  color:const  Color(0xFFDFDDDF),
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
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:  Center(
                                  child:  Container(
                                    width:Get.width*0.1,
                                    height: 8,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFFF2F0F3),
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
                            ]
                        )
                      ]
                  ),
                )
            ).animate(onPlay: (controller) => controller.repeat())
                .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                .animate() // this wraps the previous Animate in another Animate
                .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                .slide(),
          );
        },

      ),
    );
  }
}
