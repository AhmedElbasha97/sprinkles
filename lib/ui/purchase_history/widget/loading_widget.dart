import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height*0.77,
      width: Get.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:9,
        itemBuilder: (_, index) =>
        Get.find<StorageService>().activeLocale == SupportedLocales.english?Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Container(
                width:Get.width,
                height:Get.height*0.195,
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    color:Colors.white,
                    border: Border.all(color: kDarkPinkColor,width: 1)
                ),
              ),
              Positioned(
                  bottom:0,
                  left:0,
                  child:Container(
                    height:Get.height*0.09,
                    width: Get.width*0.3,
                    decoration:const BoxDecoration(
                      borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/Image 2.png",
                        ),
                        fit:  BoxFit.cover,
                      ),

                    ),
                  )
              ),
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height:Get.height*0.175,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Container(
                              width:Get.width*0.5,
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
                              width:Get.width*0.4,
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width:Get.width*0.5,
                                child: Row(
                                  children: [
                                    Container(
                                      width:Get.width*0.2,
                                      height: 13,
                                      decoration: BoxDecoration(
                                          color:  const Color(0xFFF2F0F3),
                                          borderRadius: BorderRadius.circular(50)
                                      ),

                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate() // this wraps the previous Animate in another Animate
                                        .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
                                        .slide(),
                                    const SizedBox(width: 5,),
                                    Container(
                                      width:Get.width*0.1,
                                      height:Get.height*0.05,
                                      decoration:BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50),

                                      ),
                                      child:  Center(
                                        child: Container(

                                          width:Get.width*0.065,
                                          height:Get.height*0.03,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                        ,
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate(),

                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(

                        width:Get.width*0.4,
                        height:Get.height*0.16,
                        decoration:BoxDecoration(
                          color:  const Color(0xFFF2F0F3),
                          borderRadius: BorderRadius.circular(15),
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

                            width:Get.width*0.37,
                            height:Get.height*0.13,
                            decoration:BoxDecoration(
                              color:  const Color(0xFFDFDDDF),
                              borderRadius: BorderRadius.circular(15),

                            ),
                          ).animate(onPlay: (controller) => controller.repeat())
                              .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                              .animate() // this wraps the previous Animate in another Animate
                          ,
                        ),
                      ).animate(onPlay: (controller) => controller.repeat())
                          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                          .animate() // this wraps the previous Animate in another Animate
                      ,


                    ],
                  ),
                ),
              )
            ],
          ),
        ):
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: [
              Container(
                width:Get.width,
                height:Get.height*0.195,
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(10),
                    color:Colors.white,
                    border: Border.all(color: kDarkPinkColor,width: 1)
                ),
              ),
              Positioned(
                  bottom:0,
                  left:0,
                  child:Container(
                    height:Get.height*0.09,
                    width: Get.width*0.3,
                    decoration:const BoxDecoration(
                      borderRadius:BorderRadius.only(bottomLeft:Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/Image 2.png",
                        ),
                        fit:  BoxFit.cover,
                      ),

                    ),
                  )
              ),
              Positioned(
                top: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Container(

                      width:Get.width*0.4,
                      height:Get.height*0.16,
                      decoration:BoxDecoration(
                        color:  const Color(0xFFF2F0F3),
                        borderRadius: BorderRadius.circular(15),
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

                          width:Get.width*0.37,
                          height:Get.height*0.13,
                          decoration:BoxDecoration(
                            color:  const Color(0xFFDFDDDF),
                            borderRadius: BorderRadius.circular(15),

                          ),
                        ).animate(onPlay: (controller) => controller.repeat())
                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                            .animate() // this wraps the previous Animate in another Animate
                        ,
                      ),
                    ).animate(onPlay: (controller) => controller.repeat())
                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                        .animate() ,// this wraps the previous Animate in another Animate,
                      const SizedBox(width: 20,),
                      SizedBox(
                        height:Get.height*0.175,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Container(
                              width:Get.width*0.5,
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
                              width:Get.width*0.4,
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: SizedBox(
                                width:Get.width*0.5,
                                child: Row(
                                  children: [
                                    Container(
                                      width:Get.width*0.1,
                                      height:Get.height*0.05,
                                      decoration:BoxDecoration(
                                        color: const Color(0xFFDFDDDF),
                                        borderRadius: BorderRadius.circular(50),

                                      ),
                                      child:  Center(
                                        child: Container(

                                          width:Get.width*0.065,
                                          height:Get.height*0.03,
                                          decoration:BoxDecoration(
                                            color:  const Color(0xFFF2F0F3),
                                            borderRadius: BorderRadius.circular(15),

                                          ),
                                        ).animate(onPlay: (controller) => controller.repeat())
                                            .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                            .animate() // this wraps the previous Animate in another Animate
                                        ,
                                      ),
                                    ).animate(onPlay: (controller) => controller.repeat())
                                        .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(10))
                                        .animate(),
                                    const SizedBox(width: 5,),

                                    Container(
                                      width:Get.width*0.2,
                                      height: 13,
                                      decoration: BoxDecoration(
                                          color:  const Color(0xFFF2F0F3),
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
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ).animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: 1200.ms, color:  kDarkPinkColor.withAlpha(85))
          .animate() // this wraps the previous Animate in another Animate
          .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
          .slide(),
    );
  }
}
