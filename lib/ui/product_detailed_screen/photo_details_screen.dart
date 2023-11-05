// ignore_for_file: avoid_print, sort_child_properties_last, prefer_is_empty

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/widgets/loader.dart';

import '../../Utils/constant.dart';
import '../../widgets/custom_text_widget.dart';

class PhotoDetailedScreen extends StatefulWidget {
  final List<String>? link;
  final int? index;
  const PhotoDetailedScreen({Key? key,  this.link, this.index}) : super(key: key);

  @override
  State<PhotoDetailedScreen> createState() => _PhotoDetailedScreenState();
}

class _PhotoDetailedScreenState extends State<PhotoDetailedScreen> {
  int activeIndex = 0;
  getNextImage(){
    if(activeIndex != ((widget.link?.length??0)-1)){
      activeIndex += 1;
      setState((){});
    }
  }
  getPreviousImage(){
    if(activeIndex != 0){
      activeIndex -= 1;
      setState((){});
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    activeIndex = (widget.index??0);
    print(activeIndex);
    setState((){});
  }
  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Center(
            child: Hero(
              tag: 'imageHero ${widget.index}',
              child: PinchZoom(
                  resetDuration:const Duration(milliseconds: 100000),
                child: CachedNetworkImage(
                  color: Colors.grey.withOpacity(0.5),
                  imageUrl:   widget.index == -1?"${Services.baseEndPoint}${widget.link?[0]??""}":"${Services.baseEndPoint}${widget.link?[activeIndex]??""}",
                  imageBuilder: ((context, image){
                    return  Container(
                        width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,

                              fit: BoxFit.fitWidth,
                            ),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(15))

                        )
                    );
                  }),
                  placeholder:  (context, image){
                    return  const Loader();
                  },
                  errorWidget: (context, url, error){
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/no_data_slideShow.png"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))

                        )
                    );
                  },
                ),

                maxScale: 3.5,
                onZoomStart: (){},
                onZoomEnd: (){print('Stop zooming');},
              ),
            ),
          ),
           Positioned(
              top: 10,
              left: 10,
              child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child:  const Icon(
                  Icons.clear_outlined,
                  color: Colors.white,
                  size: 50,
                ),
              )),
          widget.index == -1?const SizedBox():Positioned(
            right:10,
            top:15,
            child: Container(
                width:Get.width*0.2,
                height:Get.height*0.04,
                decoration:BoxDecoration(
                  borderRadius:BorderRadius.circular(20),
                  color:kBackGroundColor.withOpacity(0.65),
                ),
                child:Center(
                  child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      CustomText(
                        "${activeIndex + 1}/${widget.link?.length}",
                        style:  TextStyle(
                          height: 1.3,
                          fontSize: 12,
                          letterSpacing: 0,
                          fontFamily: Get
                              .find<StorageService>()
                              .activeLocale == SupportedLocales.english ?fontFamilyEnglishName:fontFamilyArabicName,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width:10,
                      ),
                      const Icon(
                        Icons.image,
                        color: Colors.black,
                        size: 17,
                      ),
                    ],
                  ),

                )
            ),
          ),
          widget.index == -1?const SizedBox():activeIndex != ((widget.link?.length??0)-1)?Positioned(
              top: Get.height*0.45,
              left: 10,
              child: GestureDetector(
                onTap: (){
                  getNextImage();
                },
                child:  const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              )):const SizedBox(),
          widget.index == -1?const SizedBox():activeIndex != 0?Positioned(
              top: Get.height*0.45,
              right: 10,
              child: GestureDetector(
                onTap: (){
                  getPreviousImage();
                },
                child:  const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                  size: 50,
                ),
              )):const SizedBox(),
        ],
      ),
    );
  }
}