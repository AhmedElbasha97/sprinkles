import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sprinkles/ui/welcome_screen/welcome_screen_ui.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.off(const WelcomeScreenUI());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: Get.height,
        width: Get.width,
        decoration:  const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/homeBG.jpg"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: SizedBox(
            height: Get.height*0.40,
            width: Get.width*0.8,
            child: Image.asset("assets/images/logo sprinkles.png",fit: BoxFit.fitHeight,),
          ),
        ),
      ),
    );
  }
}
