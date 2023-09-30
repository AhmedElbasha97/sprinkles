// ignore_for_file: empty_catches

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/models/shop_detailed_model.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/services/shop_services.dart';
import 'package:sprinkles/ui/login/login_screen.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/ui/siginup/signup_screen.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';
import 'package:sprinkles/widgets/yes_or_no_dialogue.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreDetailedController extends GetxController{
 bool shopIsLoading = true;
 ScrollController scrollController = ScrollController();
 bool shopProductIsLoading = true;
 late List<ProductsModel>? productList;
 late ShopDetailedModel? shopData;
 int selectedSubCategoryId = 0;
 List<Widget> products = [];
 bool storeAreAddedOrNot = false;
 GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
 final String shopId;
 final int mainCategoryId;
 final BuildContext context;

  StoreDetailedController({required this.context, required this.mainCategoryId, required this.shopId});

 @override
  Future<void> onInit() async {
   super.onInit();
   await getData();

 }

 selectingAnotherSubCategory(int subCategoryId){
   selectedSubCategoryId = subCategoryId;
   getProductData(true);

 }

getData() async {
  shopData = await ShopServices.getShopDetails(shopId);
  selectedSubCategoryId = shopData?.ctgs?[0].id??0;
  await checkStoreAddedOrNet();
  shopIsLoading=false;
  getProductData(true);
  update();
}
 getProductData(bool changingTap) async {

   if(changingTap) {
     shopProductIsLoading = true;
     update();
   }
       productList = await ShopServices.getProductsOfTheShop(shopId,"$selectedSubCategoryId");
   await fillingData();
   shopProductIsLoading = false;
   update();
   }
  showStoreLocation() async {
    await MapLauncher.showMarker(
      mapType: Platform.isAndroid
          ?MapType.google:MapType.apple,
      coords: Coords(double.parse( shopData?.locationLat??"0.0"), double.parse( shopData?.locationLon??"0.0")),
      title: " ${storeLocation.tr} ${ Get.find<StorageService>().activeLocale == SupportedLocales.english?shopData?.nameEn:shopData?.name}",
      description: " ${storeLocation.tr} ${ Get.find<StorageService>().activeLocale == SupportedLocales.english?shopData?.nameEn:shopData?.name}",
    );
  }
 Future<void> makePhoneCall() async {
   final Uri launchUri = Uri(
     scheme: 'tel',
     path: shopData?.phone,
   );
   await launchUrl(launchUri);
 }
 fillingData()  async {
   products = [];

   for (int i = 0; i <= productList!.length-1; i=i+2) {
     if(i<productList!.length-1){

       var checker =await checkProductAddedOrNet("${productList?[i].id}");
       var checker1 =await checkProductAddedOrNet("${productList?[i+1].id}");
       products.add(
           Padding(
             padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
             child: Row(
                 mainAxisAlignment:MainAxisAlignment.spaceAround,
                 children:[
                   ProductWidget(product:productList?[i], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                     addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,true);
                   }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId),

                   ProductWidget(product:productList?[i+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                     addingOrRemovingProductToFavorite(context,"${productList?[i+1].id}",i,true);
                   }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                 ]
             ),
           )
       );

     }
     else{
       var checker =await checkProductAddedOrNet("${productList?[i].id}");
       products.add(
           Column(
             children: [
               Row(
                   mainAxisAlignment:MainAxisAlignment.start,
                   children:[
                     Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ProductWidget(product:productList?[i], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                           addingOrRemovingProductToFavorite(context,"${productList?[i].id}",i,false);
                         }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                     ),

                   ]
               ),

             ],
           )
       );
     }

   }
 }
 Future<bool> checkProductAddedOrNet(String productId) async {
   FavoriteStatusModel? data= await  FavoriteServices.getProductIsInFavoriteOrNot(productId);
   if(data?.status == 1){
     return true;
   }else{
     return false;
   }
 }
 addingOrRemovingProductToFavorite(context,String productId,int index,bool doubleProductOrNot) async {
   var i = 0;
   if(index != 0){
     i = index - 1;
   }
   if(Get.find<StorageService>().checkUserIsSignedIn){
     if( await checkProductAddedOrNet(productId)){
       ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
       if(data?.msg != "succeeded"){
         showDialog(context: context,
             builder: (context) {
               return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
             }
         );
       }
       if(doubleProductOrNot){
         var checker =await checkProductAddedOrNet("${productList?[index].id}");
         var checker1 =await checkProductAddedOrNet("${productList?[index+1].id}");
         products[i]=Padding(
           padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
           child: Row(
               mainAxisAlignment:MainAxisAlignment.spaceAround,
               children:[
                 ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                   addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                 }, mainCategoryId: mainCategoryId, comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true, branchCategoryId: selectedSubCategoryId,),

                 ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                   addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                 }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
               ]
           ),
         );
         update();
       }else{
         var checker =await checkProductAddedOrNet("${productList?[index].id}");
         products[i]=Column(
           children: [
             Row(
                 mainAxisAlignment:MainAxisAlignment.start,
                 children:[
                   Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                         addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                       }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                   ),

                 ]
             ),

           ],
         );
         update();
       }

     }else{
       ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"1");
       if(data?.msg != "succeeded"){
         showDialog(context: context,
             builder: (context) {
               return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
             }
         );
       }else{
         if(doubleProductOrNot){
           var checker =await checkProductAddedOrNet("${productList?[index].id}");
           var checker1 =await checkProductAddedOrNet("${productList?[index+1].id}");
           products[i]=Padding(
             padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
             child: Row(
                 mainAxisAlignment:MainAxisAlignment.spaceAround,
                 children:[
                   ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                     addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,true);
                   }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId),

                   ProductWidget(product:productList?[index+1], productAreAddedOrNot: checker1 , addingOrRemovingProductToFavorite: (){
                     addingOrRemovingProductToFavorite(context,"${productList?[index+1].id}",index,true);
                   }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                 ]
             ),
           );
           update();
         }else{
           var checker =await checkProductAddedOrNet("${productList?[index].id}");
           products[i]=Column(
             children: [
               Row(
                   mainAxisAlignment:MainAxisAlignment.start,
                   children:[
                     Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: ProductWidget(product:productList?[index], productAreAddedOrNot: checker , addingOrRemovingProductToFavorite: (){
                           addingOrRemovingProductToFavorite(context,"${productList?[index].id}",index,false);
                         }, mainCategoryId: mainCategoryId,comingFromProductDetails: false, comingFromFavoriteList: false, comingFromProductList: true,branchCategoryId: selectedSubCategoryId)
                     ),

                   ]
               ),

             ],
           );
           update();
         }
       }
     }

   }else{
     showWarningFavorite(context);
   }
 }
 showWarningFavorite(context){
   showDialog(context: context,
       builder: (context) {
         return YesOrNoDialogue(alertText: addToFavoriteValue.tr, alertTitle: addToFavoriteTitle.tr, alertYesButtonTitle: signUpProfile.tr, alertNoButtonTitle: signInProfile.tr, alertYesButtonWidth: Get.width*0.5, alertNoButtonWidth: Get.width*0.5, alertYesButtonFunction: (){
           Get.to(()=>const SignupScreen());
         }, alertNoButtonFunction: (){
           Get.to(()=>LoginScreen());
         }, alertYesButtonIcon: 'assets/icons/signUpIconDrawer.png', alertNoButtonIcon: 'assets/icons/loginIcon.png', alertIcon: 'assets/icons/favoriteIcon.png',containerHeight:Get.height*0.6);
       });
 }
 whatsapp() async{

   var androidUrl = "whatsapp://send?phone=${shopData?.whatsapp}&text=${whatsAppInfoText.tr}";
   var iosUrl = "https://wa.me/${shopData?.whatsapp}?text=${Uri.parse(whatsAppInfoText.tr)}";

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
 checkStoreAddedOrNet() async {
   FavoriteStatusModel? data= await  FavoriteServices.getShopIsInFavoriteOrNot(shopId);
   if(data?.status == 1){
     storeAreAddedOrNot = true;
   }else{
     storeAreAddedOrNot = false;
   }
 }
 addingOrRemovingStoreToFavorite(context) async {
   if(Get.find<StorageService>().checkUserIsSignedIn){
     if(storeAreAddedOrNot){
       ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(shopId,"0");
       if(data?.msg != "succeeded"){
         showDialog(context: context,
             builder: (context) {
               return AlertDialogue(alertTitle: 'حدث خطأ', alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
             }
         );
       }
       await checkStoreAddedOrNet();
       update();
     }else{
       ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(shopId,"1");
       if(data?.msg != "succeeded"){
         showDialog(context: context,
             builder: (context) {
               return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
             }
         );
       }
       await checkStoreAddedOrNet();
       update();
     }
   }else{
     showWarningFavorite(context);
   }
 }

}
