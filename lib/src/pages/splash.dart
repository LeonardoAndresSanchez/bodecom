import 'package:animated_splash/animated_splash.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bodecom/src/pages/home_page.dart';
import 'package:bodecom/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:page_transition/page_transition.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // return SplashScreenView(
    //   home: HomePage(),
    //   duration: 4000,
    //   imageSize: 100,
    //   imageSrc: 'assets/favicon.png',
    //   text: "BODECOM",
    //   textType: TextType.ColorizeAnimationText,
    //   textStyle: TextStyle(
    //       fontFamily: 'UniversCondensed', fontSize: 40.0, letterSpacing: 0.5),
    //   colors: [
    //     HexColor('#2E78EF'),
    //     HexColor('#329BFF'),
    //     HexColor('#8840FF'),
    //     // Colors.purple,
    //     // Colors.blue,
    //     // Colors.yellow,
    //     // Colors.red,
    //   ],
    //   backgroundColor: HexColor('#1E264A'),
    // );

    return AnimatedSplash(
      imagePath: 'assets/logoBodecom.png',
      home: HomePage(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
      // backgroundColor: HexColor('#1E264A'),
    );

    // return AnimatedSplashScreen(
    //     backgroundColor: HexColor('#1E264A'),
    //     nextScreen: HomePage(),
    //     // centered: true,
    //     splashTransition: SplashTransition.fadeTransition,
    //     pageTransitionType: PageTransitionType.rightToLeftWithFade,
    //     splash: 'assets/logoBodecom.png');
    // // Image.asset('assets/logoComunixBlanco.png',
    // //     height: size.height * 0.08));
  }

  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };

  Map<int, Widget> op = {1: LoginPage(), 2: HomePage()};
}
