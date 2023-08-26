// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sprinkles/Utils/colors.dart';
import 'package:sprinkles/Utils/connection_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sprinkles/Utils/localization_services.dart';

import 'package:sprinkles/Utils/memory.dart';
import 'package:sprinkles/Utils/transelation/app_transelation.dart';
import 'package:sprinkles/services/network_status_service.dart';
import 'package:sprinkles/ui/splash_screen/splash_screen.dart';
import 'dart:io';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => StorageService.init(), permanent: true);
  Get.put(LocalizationService.init(), permanent: true);
  Get.put<NetworkStatusService>(NetworkStatusService(), permanent: true);
  await Get.putAsync(() => ConnectionService.init(), permanent: true);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: kLightPinkColor, // navigation bar color
    statusBarColor: kDarkPinkColor, // status bar color
  ));
  runApp(  const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),



      locale:  Get.find<LocalizationService>().activeLocale,
      supportedLocales: SupportedLocales.all,
      fallbackLocale: SupportedLocales.english,
      localizationsDelegates:  const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),

    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}