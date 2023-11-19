import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/ui/reviewiingMessage/controller/reviewing_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';
import 'package:star_rating/star_rating.dart';
import '../../Utils/translation_key.dart';
class ReviewingMessageWidget extends StatelessWidget {
  final  int historyId;
  const ReviewingMessageWidget({Key? key, required this.historyId, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReviewingController>(
      init: ReviewingController(historyId),
      builder: (controller) => Dialog(
        backgroundColor:Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 0,
        child: SingleChildScrollView(
          child: Container(
            height:Get.height <= 800? Get.height*0.6: Get.height*0.5,
            color:Colors.transparent,

            child: Center(
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Positioned(
                    bottom:0,
                    child: Center(
                      child:  Container(
                          padding:  EdgeInsets.only(top:Get.height*0.1,left:0,right:0,bottom:0),                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color:kDarkPinkColor,
                        boxShadow: [
                          BoxShadow(
                            color:  Colors.black.withOpacity(0.3),
                            blurRadius: 4,
                            offset: const Offset(6, 5), // Shadow position
                          ),
                        ],
                      ),

                          width:Get.width*0.9,
                          child: Container(

                            width:Get.width*0.85,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                              color:kBackGroundColor,
                              boxShadow: [
                                BoxShadow(
                                  color:  Colors.black.withOpacity(0.3),
                                  blurRadius: 4,
                                  offset: const Offset(6, 5), // Shadow position
                                ),
                              ],
                            ),
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children:  [
                              Row(
                                children: [
                                  CustomText(ratingStore.tr,
                                    style:  TextStyle(
                                        fontFamily: Get
                                            .find<StorageService>()
                                            .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),),
                                  const SizedBox(width: 10,),
                                  StarRating(
                                    color: kLightPinkColor,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    length: 5,
                                    rating: controller.hospitalReview,
                                    between: 0,
                                    starSize: 20,
                                    onRaitingTap: (rating) {
                                      controller.changeHospitalReview(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Row(
                                children: [
                                  CustomText(ratingProduct.tr,
                                    style: TextStyle(
                                        fontFamily: Get
                                            .find<StorageService>()
                                            .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                        color: kDarkPinkColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18),),
                                  const SizedBox(width: 10,),
                                  StarRating(
                                    color: kLightPinkColor,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    length: 5,
                                    rating: controller.doctorReview,
                                    between: 0,
                                    starSize: 20,
                                    onRaitingTap: (rating) {
                                      controller.changeDoctorReview(rating);
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextFormField(
                                    controller: controller.msgController,
                                    maxLines: 4,
                                    textAlign: TextAlign.right,
                                    decoration:   InputDecoration(
                                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                                      fillColor:kDarkPinkColor,
                                      hintText: commentTitle.tr,
                                      errorBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.circular(4)),
                                      focusedErrorBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.red),
                                          borderRadius: BorderRadius.circular(4)),
                                      focusedBorder:  const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: kDarkPinkColor, width: 2.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      enabledBorder:  const OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: kDarkPinkColor, width: 1.0),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 10,),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: InkWell(
                                    onTap: () {
                                      controller.addReview(context);


                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width * 0.7,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all( color:Colors.white,width: 2),
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
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [kDarkPinkColor,kLightPinkColor],
                                        ),borderRadius: BorderRadius.circular(40), //
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        sendingReport.tr,
                                        style: const TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                            ),
                          )
                      ),

                    ),
                  ),
                  Positioned(
                    top:0,

                    child: Container(
                      width:Get.width*0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(

                            padding:const EdgeInsets.all(2),
                            decoration: const BoxDecoration(

                                shape: BoxShape.circle,color:kDarkPinkColor
                            ),
                            height: Get.height*0.15,
                            width: Get.width*0.3,
                            child: Image.asset("assets/icons/succesIcon.png",fit: BoxFit.fitHeight,),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ).animate(onPlay: (controller) => controller.repeat())

              .animate() // this wraps the previous Animate in another Animate
              .fadeIn(duration: 700.ms, curve: Curves.easeOutQuad)
              .slide(),
        ),
      )
    );

  }
}