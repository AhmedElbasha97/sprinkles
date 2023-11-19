// ignore_for_file: empty_catches, unrelated_type_equality_checks, prefer_adjacent_string_concatenation, deprecated_member_use, prefer_interpolation_to_compose_strings

import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/services.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/comment_model.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/product_detailed_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/services/product_service.dart';
import 'package:sprinkles/services/reviews_services.dart';
import 'package:sprinkles/services/stats_services.dart';
import 'package:sprinkles/ui/branches_list/branches_list_screen.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:video_player/video_player.dart';
import '../../../Utils/colors.dart';

class ProductDetailedController extends GetxController{
  bool productAreAddedOrNot = false;
  bool checker =false;
  CarouselController carouselController = CarouselController();
  ScrollController scrollController = ScrollController();
  int activeIndex = 0;
  List<CommentModel>? comments = [];
  bool productIsLoading = true;
  late  VideoPlayerController videoPlayerController;
  late ProductDetailedModel? productData;
  late List<ProductsModel>? productsList;
  final String productId;
  List<Widget> dotsList = [];
  String messageTextWhatsApp = "";
  ProductDetailedController(this.productId, this.mainCategoryId, this.branchCategoryId,);
  final int mainCategoryId;
  final int branchCategoryId;
  int selectedProductId = 24543;
  bool favoriteHasBeenSelected = false;
  @override
  Future<void> onInit() async {
    super.onInit();

    getProductData();
  }

  checkerProductsAddedOrNet(String productId) async {
     if(Get.find<StorageService>().checkUserIsSignedIn) {
       FavoriteStatusModel? data = await FavoriteServices
           .getProductIsInFavoriteOrNot(productId);
       if (data == 1) {

        return true;


       } else {


         return false;

       }
     }else{

       return false;

     }
  }
  addingOrRemovingProductsToFavorite(context,String productId,int index) async {

    if(Get.find<StorageService>().checkUserIsSignedIn){
      if( await  checkerProductsAddedOrNet(productId)){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          productsList?.elementAt(index).favorite = 0;
          productsList?[index].favorite = 0;
          update();


        }

      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }else{
          productsList?.elementAt(index).favorite = 1;
          productsList?[index].favorite = 1;
          update();

        }

      }
    }else{
      showWarningFavorite(context);
    }
  }
  checkProductAddedOrNet() async {
    FavoriteStatusModel? data= await  FavoriteServices.getProductIsInFavoriteOrNot(productId);
    if(data?.status == 1){
      productAreAddedOrNot = true;
    }else{
      productAreAddedOrNot = false;
    }
  }
  addingOrRemovingProductToFavorite(context) async {
    if(Get.find<StorageService>().checkUserIsSignedIn){
      if(productAreAddedOrNot){
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }
        await checkProductAddedOrNet();
        update();
      }else{
        ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
        if(data?.msg != "succeeded"){
          showDialog(context: context,
              builder: (context) {
                return AlertDialogue(alertTitle:errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
              }
          );
        }
        await checkProductAddedOrNet();
        update();
      }
    }else{
      showWarningFavorite(context);
    }
  }
  selectingAnotherItem(int itemId ){
    selectedProductId = itemId;
    update();
    getProductData();
  }
  getProductData() async {
    productIsLoading = true;
    update();
    if(selectedProductId != 24543){
      comments = await ReviewsServices().getProductComment("$selectedProductId");
      productData =
      await ProductServices.getProductDetails("$selectedProductId");
      productsList =
      await ProductServices.getProducts(mainCategoryId, productData?.ctg?.id??0, "0");
      if(productData?.video != ""){
        videoPlayerController =
        VideoPlayerController.network('${Services.baseEndPoint}${productData?.video??""}')
          ..initialize().then((_) {
            update();
          });
      }
      productsList?.removeWhere((element)=>
      element.id == selectedProductId
      );
    }else {
      comments = await ReviewsServices().getProductComment(productId);
      productData =
      await ProductServices.getProductDetails(productId);
      productsList =
      await ProductServices.getProducts(mainCategoryId, productData?.ctg?.id??0, "0");
      if(productData?.video != null){
        videoPlayerController =
        VideoPlayerController.network('${Services.baseEndPoint}${productData?.video??""}')
          ..initialize().then((_) {
            update();
          });
      }
      productsList?.removeWhere((element)=>
        "${element.id}" == productId
      );
    }

    makingDotsForCarouselSlider();
    if(Get.find<StorageService>().checkUserIsSignedIn) {
      checkProductAddedOrNet();
    }
    messageTextWhatsApp = ' رأيت هذا ال ${productData?.name??""} في تطبيق سبرينكلز و وأريد الاستفسار عنه ' + '\n I saw this ${productData?.nameEn??""} In the Sprinkles app and I want to make an order ' ;
    productIsLoading = false;
    update();
  }
  showWarningFavorite(context){
    showDialog(context: context,
        builder: (context) {
      return YesOrNoDialogue(alertText: addToFavoriteValue.tr, alertTitle: addToFavoriteTitle.tr, alertYesButtonTitle: signUpProfile.tr, alertNoButtonTitle: signInProfile.tr, alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
        Get.to(()=>const SignupScreen());
      }, alertNoButtonFunction: (){
        Get.to(()=>LoginScreen());
      }, alertYesButtonIcon: 'assets/icons/signUpIconDrawer.png', alertNoButtonIcon: 'assets/icons/loginIcon.png', alertIcon: 'assets/icons/favoriteIcon.png',containerHeight:Get.height <= 800? Get.height*0.6: Get.height*0.5);
    });
  }
  makingDotsForCarouselSlider(){
   int productLength = productData?.images?.length??0;
    dotsList = [];
    for(int i=0;i<productLength;i++){
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
    update(["Carsoul"]);
  }
  Future<void> makePhoneCall(String phoneNumber,context) async {
    if(productData?.shop?.branch?.length != 0){
      var iosUrl = "https://wa.me/${productData?.shop?.whatsapp}?text=${Uri.parse(
          messageTextWhatsApp)} /n  ${productData?.link}" ;
      var androidUrl = "whatsapp://send?phone=${productData?.shop?.whatsapp}&text=$messageTextWhatsApp /n ${productData?.link} ";
      showDialog(context: context,
        builder: (context) =>
            BranchesListWidget(branch: productData?.shop?.branch, androidUrl:androidUrl, iosUrl: iosUrl, shopId: "${ productData?.shop?.id??0}", productId: "${ productData?.id??0}",),);
    }
    else {
      var result = await StatsServices().sendingOrderNowOrWhatsAppOrCallHasBeenClicked("${productData?.shop?.id??0}", "${productData?.id}", OrderType.CALL.name, "0");
      if(result?.status == "true") {
        final Uri launchUri = Uri(
          scheme: 'tel',
          path: phoneNumber,
        );
        await launchUrl(launchUri);
      }

    }

  }
  whatsapp(String contact,context) async{
    if(productData?.shop?.branch?.length != 0){
      var iosUrl = "https://wa.me/${productData?.shop?.whatsapp}?text=${Uri.parse(
          messageTextWhatsApp)} /n  ${productData?.link}" ;
      var androidUrl = "whatsapp://send?phone=${productData?.shop?.whatsapp}&text=$messageTextWhatsApp /n ${productData?.link} ";
      showDialog(context: context,
        builder: (context) =>
            BranchesListWidget(branch: productData?.shop?.branch, androidUrl:androidUrl, iosUrl: iosUrl, shopId: "${ productData?.shop?.id??0}", productId: "${ productData?.id??0}",),);
    }
    else {
      var result = await StatsServices().sendingOrderNowOrWhatsAppOrCallHasBeenClicked("${productData?.shop?.id??0}", "${productData?.id}", OrderType.WHATSAPP.name, "0");
      if(result?.status == "true") {
        try {
          if (Platform.isIOS) {
            var iosUrl = "https://wa.me/$contact?text=${Uri.parse(
                messageTextWhatsApp)} /n  ${productData?.link}" ;
            await launchUrl(Uri.parse(iosUrl));
          }
          else {
            var androidUrl = "whatsapp://send?phone=$contact&text=$messageTextWhatsApp /n ${productData?.link} ";
            await launchUrl(Uri.parse(androidUrl));
          }
        } on Exception {

        }
      }
    }

    }

}