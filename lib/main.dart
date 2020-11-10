import 'package:bodecom/src/blocs/provider.dart';
import 'package:bodecom/src/forms/VentasForm.dart';
import 'package:bodecom/src/forms/ventasFormIndividual.dart';
import 'package:bodecom/src/pages/menuModulo1.dart';
import 'package:bodecom/src/pages/modulo1.dart';
import 'package:bodecom/src/pages/home_page.dart';
import 'package:bodecom/src/pages/login_page.dart';
import 'package:bodecom/src/pages/producto_page.dart';
import 'package:bodecom/src/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'splash',
        routes: {
          'splash': (context) => SplashScreen(),
          'login': (context) => LoginPage(),
          'home': (context) => HomePage(),
          'producto': (context) => ProductoPage(),
          'modulo1': (context) => Modulo1Page(),
          'ventas': (context) => VentasFormPage(),
          'ventasIndividual': (context) => VentasFormIndividual(),
          'menuModulo1': (context) => MenuModulo1(),
        },
        theme:
            ThemeData(primaryColor: HexColor('#1E264A'), fontFamily: 'Roboto'),
      ),
    );
  }
}
