import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class ProductImageWidget extends StatelessWidget {
  const ProductImageWidget({Key? key, required this.imageUrl, required this.activeIndex, required this.imageTotalCount}) : super(key: key);
  final String? imageUrl;
  final String activeIndex;
  final String imageTotalCount;
  @override
  Widget build(BuildContext context) {
    return  CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl:  "https://cake.syncqatar.com${imageUrl??""}",
      imageBuilder: ((context, image){
        return  Stack(
          children: [
            Container(
                width:Get.width,
                height:Get.height*0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit:  BoxFit.fill,
                  ),
                )
            ),
            Positioned(
              left:10,
              top:10,
              child: Container(
                  width:Get.width*0.15,
                  height:Get.height*0.03,
                decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(20),
                  color:kBackGroundColor.withOpacity(0.65),
                ),
                child:Center(
                  child: CustomText(
                    "$activeIndex/$imageTotalCount",
                    style: const TextStyle(
                      height: 1.3,
                      fontSize: 12,
                      letterSpacing: 0,
                      fontFamily: fontFamilyArabicName,
                      color: kDarkPinkColor,
                    ),
                  ),

                )
                  ),
            )

          ],
        );
      }),
      placeholder: (context, image){
        return   Container(

          width:Get.width,
          height:Get.height*0.4,
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

              width:Get.width*0.95,
              height:Get.height*0.38,
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
            ;
      },
      errorWidget: (context, url, error){
        return SizedBox(
          width:Get.width,
          height:Get.height*0.4,
          child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
        );
      },
    );
  }
}
