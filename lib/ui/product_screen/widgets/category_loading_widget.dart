// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';

class CategoryLoadingWidget extends StatelessWidget {
  const CategoryLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width:Get.width*0.95,
      height: Get.height*0.13,
      child: ListView.builder(

        scrollDirection:Axis.horizontal,
        shrinkWrap:true,
        itemCount:20,
        itemBuilder: (BuildContext context, int index) { return
          Container(
            height: Get.height*0.13,
            width:Get.width*0.2,

            child:Column(
              crossAxisAlignment:CrossAxisAlignment.center,
              mainAxisAlignment:MainAxisAlignment.start,
              children: [

                Center(
                  child:Container(

                    height: Get.height*0.08,
                    width:Get.width*0.17,
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

                        height: Get.height*0.06,
                        width:Get.width*0.13,
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
                  ).animate(onPlay: (controller) => controller.repeat())
                      .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                      .animate() // this wraps the previous Animate in another Animate
                      .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                      .slide(),
                ),
                SizedBox(height:10),
                Center(
                    child: Container(
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
                        .slide()
                ),
              ],
            ),
          );
        },

      ),
    );
  }
}
