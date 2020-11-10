import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:bodecom/src/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, anotherAnimation) {
              return LoginPage();
            },
            transitionDuration: Duration(milliseconds: 2000),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation =
                  CurvedAnimation(curve: Curves.slowMiddle, parent: animation);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            })));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: size.height * 0.30,
                      ),
                      FadeInUpBig(
                        duration: Duration(milliseconds: 1200),
                        child: Image.asset(
                          'assets/logoBodecom.png',
                          height: size.height * 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // CircularProgressIndicator(),
                    FadeInUpBig(
                      duration: Duration(milliseconds: 1300),
                      child: Lottie.asset(
                        'assets/loading.json',
                        height: size.height * 0.05,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    ),

                    FadeInUpBig(
                      duration: Duration(milliseconds: 1400),
                      child: Image.asset(
                        'assets/logoComunixRojo.png',
                        height: size.height * 0.08,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
