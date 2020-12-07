import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Perfil'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _crearInfoPerfil(),
            ],
          ),
        ));
  }

  _crearInfoPerfil() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(
                15,
              ),
              margin: EdgeInsets.only(
                top: 20,
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0.0, 10.0),
                    )
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: Image.asset(
                                  'assets/elon.png',
                                  width: 110.0,
                                  height: 110.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Elon Reeve Musk',
                                      style: TextStyle(
                                        color: HexColor('#1E264A'),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      'Director general de SpaceX',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        color: Colors.grey[500],
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 200,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.blueGrey[100],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Container(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 16,
            //   right: 16,
            //   child: CircleAvatar(
            //     child: Image.asset(
            //       'assets/favicon.png',
            //       height: 80,
            //     ),
            //     backgroundColor: HexColor('#1E264A'),
            //     radius: 50,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
