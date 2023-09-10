// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/constant.dart';
import 'package:sprinkles/Utils/localization_services.dart';
import 'package:sprinkles/Utils/memory.dart';


class CustomInputField extends StatelessWidget {
  CustomInputField(
      {Key? key,
        required this.labelText,
        this.icon,
        this.onchange,
        this.controller,
        this.keyboardType,
        this.validator,
        this.isAutoValidate = true,
        this.onFieldSubmitted,
        this.onSaved,
        this.validated,
        this.obsecure = false,
        this.focusNode,
        this.textInputAction,
        required this.hasGreenBorder,
        required this.hasIntialValue,
        this.suffixText = " ",
        this.textAligning = TextAlign.right, this.iconOfTextField})
      : super(key: key);
  final String labelText;
  final icon;
  final iconOfTextField;
  var  validated;
  final onchange;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final bool isAutoValidate;
  final TextInputType? keyboardType;
  final bool obsecure;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool hasGreenBorder;
  final bool hasIntialValue;
  final String? suffixText;
  final TextAlign textAligning;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      textAlign: textAligning,
      enableSuggestions: false,
      autocorrect: false,
      style:  TextStyle(
          fontSize: 15.0,
        fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyEnglishName:fontFamilyArabicName,

        color: kDarkPinkColor,
      ),
      focusNode: focusNode,
      keyboardType: keyboardType,
      cursorColor: kDarkPinkColor,
      obscureText: obsecure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 10),
        helperText: "",
        fillColor: kBackGroundColor,
        filled: false,

        labelText: labelText,
        labelStyle:TextStyle(
          fontSize: 15.0,
          fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyEnglishName:fontFamilyArabicName,
          color: kDarkPinkColor,
        ),
        hintStyle:   TextStyle(
          fontSize: 15.0,
          fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyEnglishName:fontFamilyArabicName,
          color: kDarkPinkColor,
        ),
        prefixIcon:iconOfTextField,
        suffixIcon: icon,
        suffixText: suffixText,
        suffixStyle:  TextStyle(
        fontSize: 15.0,
        fontFamily: Get.find<StorageService>().activeLocale == SupportedLocales.english?fontFamilyEnglishName:fontFamilyArabicName,
        color: kDarkPinkColor,
      ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(50)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(50)),
        enabledBorder:   OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color:kDarkPinkColor,),
            borderRadius: BorderRadius.circular(50)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide:   const BorderSide(color: kDarkPinkColor,width: 3.0),
            borderRadius: BorderRadius.circular(50)),
      ),
      onChanged: onchange,
      controller: controller,
      validator: validator,
      textInputAction: textInputAction,

      autovalidateMode: isAutoValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
