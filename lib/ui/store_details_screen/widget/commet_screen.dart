import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/comment_model.dart';
import 'package:sprinkles/ui/product_detailed_screen/widget/comment_widget.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key, this.comments}) : super(key: key);
  final List<CommentModel>? comments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: AppBar(
          backgroundColor:kBackGroundColor,
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kDarkPinkColor,kLightPinkColor],
                ),
              )),

          centerTitle:true,
          title: Stack(
            children: [
              // Implement the stroke
              CustomText(
                commentsTitle.tr,
                style: TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w900,
                  fontFamily:  Get
                      .find<StorageService>()
                      .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth =3
                    ..color = kBackGroundColor,
                ),
              ),
              // The text inside
              CustomText(
                commentsTitle.tr,
                style:  TextStyle(
                  fontSize: 15,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w900,
                  fontFamily:  Get
                      .find<StorageService>()
                      .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                  color: kDarkPinkColor,
                ),
              ),
            ],
          ),
          leadingWidth:Get.width*0.25,
          leading:
          InkWell(
            onTap:(){
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(

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
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children:[
                      const Icon(
                          Icons.arrow_back_ios_rounded  ,color:kDarkPinkColor,size:15
                      ),
                      CustomText(
                        goBack.tr,
                        textAlign:TextAlign.left,
                        style: TextStyle(
                          height:1,
                          shadows: <Shadow>[
                            Shadow(
                                offset: const Offset(0.5, 0.5),
                                blurRadius: 0.5,

                                color: Colors.black.withOpacity(0.5)
                            ),
                          ],
                          fontSize: 13,
                          letterSpacing: 0,
                          fontFamily: Get
                              .find<StorageService>()
                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                          color: kDarkPinkColor,
                        ),
                      ),
                    ]

                ),
              ),
            ),
          )

      ),
      body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width:Get.width*0.95,

              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(15),

              ),
              child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children:[

                        comments?.length == 0?Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            Image.asset("assets/images/Online Review-rafiki.png",height: Get.width*0.23,),
                            CustomText(noReviews.tr,style: const TextStyle(color: kDarkPinkColor,fontWeight: FontWeight.bold,fontSize: 18),textAlign: TextAlign.center,),
                          ],):
                        Container(
                          width:Get.width*0.95,


                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,

                            child: Column(
                              children: comments!.map((e){
                                return CommentWidget(data: e, isStoreComment: false,);
                              }).toList(),
                            ),
                          ),

                        )])))),
    );
  }
}
