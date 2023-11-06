// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/models/favorite_model.dart';
import 'package:sprinkles/models/products_model.dart';
import 'package:sprinkles/models/response_model.dart';
import 'package:sprinkles/models/shops_model.dart';
import 'package:sprinkles/services/favorite_services.dart';
import 'package:sprinkles/ui/product_screen/widgets/product_widget.dart';
import 'package:sprinkles/ui/store%20_screen/widget/store_widget.dart';
import 'package:sprinkles/widgets/alert_dialogue.dart';



class FavoriteController extends GetxController{
int selectedTap = 0;
bool isLoading = true;
late List<ShopsModel>? shopFavList;
late List<ProductsModel>? productFavList;
List<Widget> products = [];
List<Widget> storeListWidget = [];

final BuildContext context;

  FavoriteController(this.context);
@override
Future<void> onInit() async {
  super.onInit();
  getData();
}
getData() async {
  isLoading = true;
  update();
  if(selectedTap == 0){
    shopFavList = await FavoriteServices.getFavoriteShopsList();
    await fillStoreData(context);
  }else{
    productFavList = await FavoriteServices.getFavoriteProductsList();
    await fillingProductData();
  }
  isLoading = false;
  update();
}
selectingTap(int index){
  selectedTap = index;
  getData();
  update();
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
    if( await checkProductAddedOrNet(productId)){
      ResponseModel? data = await FavoriteServices.addOrRemoveProductFromFavorite(productId,"0");
      if(data?.msg != "succeeded"){
        showDialog(context: context,
            builder: (context) {
              return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight: Get.height*0.4);
            }
        );
      }else{
        print(productFavList?[index].name);
       productFavList?.removeAt(index);
        fillingProductData();
       update();
      }

    }


}
fillingProductData()  async {
  products = [];
  for (int i = 0; i <= productFavList!.length-1; i=i+2) {
    if(i<productFavList!.length-1){


      products.add(
          Padding(
            padding:const EdgeInsets.fromLTRB(5.0,10.0,5.0,10.0),
            child: Row(
                mainAxisAlignment:MainAxisAlignment.spaceAround,
                children:[
                  ProductWidget(product:productFavList?[i], productAreAddedOrNot: true , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productFavList?[i].id}",i,true);
                  }, mainCategoryId: 0,comingFromProductDetails: false, comingFromFavoriteList: true, comingFromProductList: false,branchCategoryId: 0,),

                  ProductWidget(product:productFavList?[i+1], productAreAddedOrNot: true , addingOrRemovingProductToFavorite: (){
                    addingOrRemovingProductToFavorite(context,"${productFavList?[i+1].id}",i,true);
                  }, mainCategoryId: 0,comingFromProductDetails: false, comingFromFavoriteList: true, comingFromProductList: false,branchCategoryId: 0,)
                ]
            ),
          )
      );

    }
    else{

      products.add(
          Row(
              mainAxisAlignment:MainAxisAlignment.start,
              children:[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProductWidget(product:productFavList?[i], productAreAddedOrNot: true , addingOrRemovingProductToFavorite: (){
                      addingOrRemovingProductToFavorite(context,"${productFavList?[i].id}",i,false);
                    }, mainCategoryId: 0,comingFromProductDetails: false, comingFromFavoriteList: true, comingFromProductList: false,branchCategoryId: 0,)
                ),

              ]
          )
      );
    }

  }
}
Future<bool> checkStoreAddedOrNet(String storeId) async {
  FavoriteStatusModel? data= await  FavoriteServices.getShopIsInFavoriteOrNot(storeId);
  if(data?.status == 1){
    return true;
  }else{
    return false;
  }
}
addingOrRemovingStoreToFavorite(context,String storeId,int index) async {
  await checkStoreAddedOrNet(storeId);

    if(  await checkStoreAddedOrNet(storeId)){
      ResponseModel? data = await FavoriteServices.addOrRemoveShopFromFavorite(storeId,"0");
      if(data?.msg != "succeeded"){
        showDialog(context: context,
            builder: (context) {
              return AlertDialogue(alertTitle: errorKey.tr, alertText: Get.find<StorageService>().activeLocale == SupportedLocales.english?data?.msg??"":data?.msgAr??"",alertIcon: "assets/icons/warningIcon.png",containerHeight:Get.height*0.4);
            }
        );
      }else{
       storeListWidget.removeAt(index);
       shopFavList?.removeAt(index);
       for (int i =  index; i <= shopFavList!.length-1; i++) {

         storeListWidget[i]=
             StoreWidget(store:shopFavList?[i], addingOrRemovingForFav: (){addingOrRemovingStoreToFavorite(context,"${shopFavList?[i].id}",i);}, shopAreAddedOrNot: shopFavList?[i].id==1, mainCategoryId: 0,);

       }
        update();
      }


    }



}
fillStoreData(context) async {
  storeListWidget =[];
  for (int i = 0; i <= shopFavList!.length-1; i++) {

    storeListWidget.add(
        StoreWidget(store:shopFavList?[i], addingOrRemovingForFav: (){addingOrRemovingStoreToFavorite(context,"${shopFavList?[i].id}",i);}, shopAreAddedOrNot: true, mainCategoryId: 0,)
    );

  }
  update();

}


}