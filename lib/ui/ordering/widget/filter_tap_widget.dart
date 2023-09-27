import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';

import '../../../Utils/localization_services.dart';
import '../../../Utils/memory.dart';

class FilterTapWidget extends StatelessWidget {
 final String filterTapTitle;
 final bool selected;
 final Function selectingTap;
  const FilterTapWidget({Key? key, required this.filterTapTitle, required this.selected, required this.selectingTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4.0),
      child: InkWell(
        onTap:(){
          selectingTap(filterTapTitle);
        },
        child: Stack(
          children: [
            Container(
              width:Get.width*0.7,
              height:Get.height*0.05,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                border: const Border(
                  right: BorderSide(color: kDarkPinkColor,width: 1),
                  left: BorderSide(color: kDarkPinkColor,width: 1),
                  top: BorderSide(color: kDarkPinkColor,width: 1),
                  bottom: BorderSide(color: kDarkPinkColor,width: 1),
                ),

                gradient:  LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: selected?[kDarkPinkColor,kLightPinkColor]:[Colors.white,Colors.white],
                ),
              ),
            ),
            Positioned(
              top:0,
              right:0,
              child: Container(
                height:Get.height*0.05,
                width: Get.width*0.17,
                decoration:const BoxDecoration(
                  borderRadius:BorderRadius.only(topRight:Radius.circular(10),bottomRight:Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/cakeBG1.png",
                    ),
                    fit:  BoxFit.fitWidth,
                  ),

                ),
              ),
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


                    SizedBox(
                      height: Get.height*0.035,
                      width:Get.width*0.075,
                      child: Image.asset("assets/icons/${selected?"okIcon.png":"emptyFrame.png"}",fit: BoxFit.fitHeight,),
                    ),
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

                    mainAxisAlignment: Get.find<StorageService>().activeLocale == SupportedLocales.english?MainAxisAlignment.end:MainAxisAlignment.start,
                    children: [
                      Stack(

                        children: [
                          // Implement the stroke
                          CustomText(
                            filterTapTitle,
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
                            filterTapTitle,
                            style: TextStyle(
                              fontSize: 15,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w900,
                              fontFamily: fontFamilyArabicName,
                              color: selected?kDarkPinkColor:kLightPinkColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ),
            ),

          ],
        ),
      ),
    );
  }
}
