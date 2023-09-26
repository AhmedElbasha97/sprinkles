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
                          SizedBox(height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
                                child: InkWell(
                                  onTap:(){

                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:Get.width*0.7,
                                        height:Get.height*0.05,
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border(
                                            right: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            left: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            top: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            bottom: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                          ),

                                          color: const Color(0xFFF2F0F3),
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),
                                      Positioned(
                                        top:0,
                                        right:0,
                                        child: Container(

                                          height:Get.height*0.05,
                                          width: Get.width*0.14,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFDFDDDF),
                                            borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),


                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide(),
                                      ),
                                      Positioned(
                                        right:5,
                                        top:5,
                                        child: Container(
                                          width:Get.width*0.1,
                                          child: Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.end,
                                            children: [


                                              Container(

                                                height: Get.height*0.035,
                                                width:Get.width*0.075,
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

                                                    height: Get.height*0.025,
                                                    width:Get.width*0.05,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left:0,
                                        child: Container(
                                          width:Get.width*0.53,
                                          height:Get.height*0.05,
                                          decoration:BoxDecoration(
                                            borderRadius:BorderRadius.circular(10),
                                            color:Colors.transparent,

                                          ),
                                          child:Container(
                                            width:Get.width*0.5,
                                            child: Row(

                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:Get.width*0.4,
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

                                              ],
                                            ),
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
                                child: InkWell(
                                  onTap:(){

                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:Get.width*0.7,
                                        height:Get.height*0.05,
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border(
                                            right: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            left: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            top: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            bottom: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                          ),

                                          color: const Color(0xFFF2F0F3),
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),
                                      Positioned(
                                        top:0,
                                        right:0,
                                        child: Container(

                                          height:Get.height*0.05,
                                          width: Get.width*0.14,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFDFDDDF),
                                            borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),


                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide(),
                                      ),
                                      Positioned(
                                        right:5,
                                        top:5,
                                        child: Container(
                                          width:Get.width*0.1,
                                          child: Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.end,
                                            children: [


                                              Container(

                                                height: Get.height*0.035,
                                                width:Get.width*0.075,
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

                                                    height: Get.height*0.025,
                                                    width:Get.width*0.05,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left:0,
                                        child: Container(
                                          width:Get.width*0.53,
                                          height:Get.height*0.05,
                                          decoration:BoxDecoration(
                                            borderRadius:BorderRadius.circular(10),
                                            color:Colors.transparent,

                                          ),
                                          child:Container(
                                            width:Get.width*0.5,
                                            child: Row(

                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:Get.width*0.4,
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

                                              ],
                                            ),
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
                                child: InkWell(
                                  onTap:(){

                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width:Get.width*0.7,
                                        height:Get.height*0.05,
                                        decoration:BoxDecoration(
                                          borderRadius:BorderRadius.circular(10),
                                          border: Border(
                                            right: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            left: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            top: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                            bottom: BorderSide(color:  const Color(0xFFDFDDDF),width: 1),
                                          ),

                                          color: const Color(0xFFF2F0F3),
                                        ),
                                      ).animate(onPlay: (controller) => controller.repeat())
                                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                          .animate() // this wraps the previous Animate in another Animate
                                          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                          .slide(),
                                      Positioned(
                                        top:0,
                                        right:0,
                                        child: Container(

                                          height:Get.height*0.05,
                                          width: Get.width*0.14,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFDFDDDF),
                                            borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),


                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                            .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                            .slide(),
                                      ),
                                      Positioned(
                                        right:5,
                                        top:5,
                                        child: Container(
                                          width:Get.width*0.1,
                                          child: Row(
                                            mainAxisAlignment:MainAxisAlignment.start,
                                            crossAxisAlignment:CrossAxisAlignment.end,
                                            children: [


                                              Container(

                                                height: Get.height*0.035,
                                                width:Get.width*0.075,
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

                                                    height: Get.height*0.025,
                                                    width:Get.width*0.05,
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
                                            ],
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left:0,
                                        child: Container(
                                          width:Get.width*0.53,
                                          height:Get.height*0.05,
                                          decoration:BoxDecoration(
                                            borderRadius:BorderRadius.circular(10),
                                            color:Colors.transparent,

                                          ),
                                          child:Container(
                                            width:Get.width*0.5,
                                            child: Row(

                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:Get.width*0.4,
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

                                              ],
                                            ),
                                          ),

                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height:Get.height*0.015)
                            ],
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
