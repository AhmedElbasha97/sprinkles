
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/translation_key.dart';
import 'package:sprinkles/ui/contact_us/controller/report_controller.dart';
import 'package:sprinkles/widgets/custom_text_widget.dart';


class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key, required this.productId, required this.storeId, }) : super(key: key);
  final String productId ;
  final String storeId ;

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(
        init:  ReportController(productId,storeId),
        builder: (ReportController controller) =>  GestureDetector(
        onTap: () => controller.unFocus(),
        child: Scaffold(
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
                    reportTitle.tr,
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
                    reportTitle.tr,
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
                              fontFamily: fontFamilyArabicName,
                              color: kDarkPinkColor,
                            ),
                          ),
                        ]

                    ),
                  ),
                ),
              )

          ),
          body: Form(
            key: controller.formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Text(
                    productId != "0"? reportProductText.tr:reportStoreText.tr,
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    focusNode: controller.nameNode,
                    controller: controller.nameController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                      counterText: "",
                      hintText:reasonForReport.tr,
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
                    ),
                    validator: controller.nameValidator,
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                    validator:controller.massageValidator,

                    focusNode: controller.msgNode,
                    controller: controller.msgController,
                    maxLines: 4,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      hintText: moreInfo.tr,
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
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: InkWell(
                      onTap: () {
                        controller.sendMessage(context);


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
        ),
      ),
    );
  }
}
