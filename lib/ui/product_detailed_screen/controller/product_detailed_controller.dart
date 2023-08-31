// ignore_for_file: empty_catches

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Utils/colors.dart';

class ProductDetailedController extends GetxController{
  CarouselController carouselController = CarouselController();
  ScrollController scrollController = ScrollController();
  int activeIndex = 0;
  bool productIsLoading = true;
  late List<ProductsModel>? productList;


  final List<String> imageList = [
    "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg",
    "https://cdn.pixabay.com/photo/2017/12/13/00/23/christmas-3015776_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/19/10/55/christmas-market-4705877_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg",
    "https://cdn.pixabay.com/photo/2019/12/22/04/18/x-mas-4711785__340.jpg",
    "https://cdn.pixabay.com/photo/2016/11/22/07/09/spruce-1848543__340.jpg"
  ];
final List<String> tagsTitle = ["عدد الأفراد","الوزن","الحشو","وقت التحضير","عدد الأفراد","الوزن","الحشو","وقت التحضير","عدد الأفراد","الوزن","الحشو","وقت التحضير",];
final List<String> tagsValue = ["10","10 كجم","فروله وكريمة","50 دقيقه","10","10 كجم","فروله وكريمة","50 دقيقه","10","10 كجم","فروله وكريمة","50 دقيقه",];

  List<Widget> dotsList = [];
  @override
  Future<void> onInit() async {
    super.onInit();
    makingDotsForCarouselSlider();
    getProductData();
  }
  getProductData() async {
    productIsLoading = true;
    update();
    productList =
    await ProductServices.getProducts(4, 1);
    productIsLoading = false;
    update();
  }
  makingDotsForCarouselSlider(){

    dotsList = [];
    for(int i=0;i<imageList.length;i++){
      dotsList.add(
          InkWell(
            onTap:(){
              onImageChange(i);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                  width:10,
                  height:10,
                  decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    color:i==activeIndex?kDarkPinkColor:kBackGroundColor,
                  )


              ),
            ),
          )
      );
    }
  }
  onImageChange(int index){
    activeIndex = index;
    carouselController.jumpToPage(index);
    makingDotsForCarouselSlider();
    update();
  }
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  whatsapp(String contact) async{

    var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
    var iosUrl = "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

    try{
      if(Platform.isIOS){
        await launchUrl(Uri.parse(iosUrl));
      }
      else{
        await launchUrl(Uri.parse(androidUrl));
      }
    } on Exception{

    }
  }
}