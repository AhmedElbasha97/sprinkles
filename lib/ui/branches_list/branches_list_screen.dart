import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/branch_model.dart';
import 'package:sprinkles/ui/branches_list/controller/branches_list_contoller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class BranchesListWidget extends StatelessWidget {
 final List<Branch>? branch;
 final String androidUrl;
 final String iosUrl;
 final String productId;
 final String shopId;
  const BranchesListWidget({Key? key, required this.branch, required this.androidUrl, required this.iosUrl, required this.productId, required this.shopId,   }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BranchesListController>(
        init: BranchesListController(iosUrl,androidUrl,productId,shopId),
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
                            padding:  EdgeInsets.only(top:Get.height*0.1,left:0,right:0,bottom:0),
                            decoration: BoxDecoration(
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
                              child: Container(
                                height:Get.height <= 800? Get.height*0.43: Get.height*0.33,
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
                                  child: ListView.builder(
                                      itemCount: branch?.length,
                                      itemBuilder: (_,index){
                                        return SizedBox(
                                          width: Get.width,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    CustomText(
                                                      Get.find<StorageService>().activeLocale == SupportedLocales.english?(branch?[index].nameEn??""):branch?[index].name??"",
                                                      style:  TextStyle(
                                                          fontFamily: Get
                                                              .find<StorageService>()
                                                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                                                          color: kDarkPinkColor,
                                                          fontWeight: FontWeight.w600),
                                                    ),
                                                    Row(
                                                      children: [
                                                        InkWell(
                                                          onTap:(){
                                                            controller.makePhoneCall(branch?[index].phone??"", context);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(bottom: 2.0),
                                                            child: SizedBox(
                                                              height: Get.height*0.04,
                                                              width: Get.width*0.1,
                                                              child: Image.asset("assets/icons/c.png",fit: BoxFit.fitHeight,),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5,),
                                                        InkWell(
                                                          onTap: (){
                                                            controller.whatsapp(branch?[index].whatsapp??"", context);
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(top: 2,bottom: 2),
                                                            child: SizedBox(
                                                              height: Get.height*0.04,
                                                              width: Get.width*0.1,
                                                              child: Image.asset("assets/icons/w.png",fit: BoxFit.fitHeight,),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Divider(
                                                color: kDarkPinkColor,
                                                height: 1,
                                                thickness: 1,
                                                endIndent: 0,
                                                indent: 0,
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                  ),
                                  ),
                                ),
                              ),
                            )
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
                              child: Image.asset("assets/icons/contactus_icon.png",fit: BoxFit.fitHeight,),
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