// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';

class FilterLoading extends StatelessWidget {
  const FilterLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height*0.7,
      width: Get.width,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount:3,
          itemBuilder: (_, index) =>
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      width:Get.width,


                      decoration:BoxDecoration(
                        border: Border.all(color:const Color(0xFFF2F0F3),width: 2),
                        borderRadius:BorderRadius.circular(10),
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

                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: Get.height*0.1,
                            width:Get.width,
                            decoration: BoxDecoration(

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
                              color:  const Color(0xFFDFDDDF),
                              borderRadius:BorderRadius.circular(5), //
                            ),
                            child:  Center(
                              child: Container(
                                width:Get.width*0.5,
                                height: 25,
                                decoration: BoxDecoration(
                                    color:const Color(0xFFF2F0F3),
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ).animate(onPlay: (controller) => controller.repeat())
                                  .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                  .animate() // this wraps the previous Animate in another Animate
                                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                  .slide(),
                            ),
                          ),





                        ],
                      ),
                    ),

                  ],
                ),
              ).animate(onPlay: (controller) => controller.repeat())
                  .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                  .animate() // this wraps the previous Animate in another Animate
                  .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                  .slide(),
      ).animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(85))
          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide(),
    );
  }
}
