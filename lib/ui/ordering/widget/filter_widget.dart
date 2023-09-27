import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/models/choosing_filiter_model.dart';
import 'package:sprinkles/models/ordering_model.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import 'filter_tap_widget.dart';

class FilterWidget extends StatelessWidget {
  final ItemFilter? data;
  final Function selectingFilterTap;
  final ChoosingFilterModel selectedValue;
  
  const FilterWidget({Key? key, required this.data, required this.selectingFilterTap, required this.selectedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Container(
            width:Get.width,


            decoration:BoxDecoration(
              border: Border.all(color:kDarkPinkColor,width: 2),
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
              crossAxisAlignment:Get.find<StorageService>().activeLocale == SupportedLocales.english? CrossAxisAlignment.end: CrossAxisAlignment.start,
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
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kDarkPinkColor,kLightPinkColor],
                    ),borderRadius:BorderRadius.circular(5), //
                  ),
                  child:  Center(
                    child: Stack(
                      children: [
                        // Implement the stroke
                        CustomText(
                          Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??"",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                            fontFamily: fontFamilyArabicName,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth =3
                              ..color = kBackGroundColor,
                          ),
                        ),
                        // The text inside
                         CustomText(
                          Get.find<StorageService>().activeLocale == SupportedLocales.english? data?.filterEn??"":data?.filter??"",
                          style: const TextStyle(
                            fontSize: 15,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w900,
                            fontFamily: fontFamilyArabicName,
                            color: kDarkPinkColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: data!.items!.map((e) =>
                      FilterTapWidget(filterTapTitle: Get.find<StorageService>().activeLocale == SupportedLocales.english? e.filterItemEn??"":e.filterItem??"",
                        selected: e.filterItem == selectedValue.filterValue,
                        selectingTap:(e){
                          selectingFilterTap(e);
                        }
                       )).toList(),
                ),
                SizedBox(height:Get.height*0.015)


              ],
            ),
          ),
          Positioned(
            bottom:0,
            left:0,
            child: Container(
              height: Get.height*0.08,
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
            ),
          ),
        ],
      ),
    );
  }
}
