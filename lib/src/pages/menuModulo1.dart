import 'package:bodecom/src/pages/Modulo1.dart';
import 'package:bodecom/src/pages/graficasModulo1.dart';
import 'package:bodecom/src/pages/tablasModulo1.dart';
import 'package:bodecom/src/pages/settings.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class MenuModulo1 extends StatefulWidget {
  @override
  _MenuModulo1State createState() => _MenuModulo1State();
}

class _MenuModulo1State extends State<MenuModulo1> {
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    Modulo1Page(),
    GraficasModulo1(),
    TablasModulo1(),
    Settings(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Modulo1Page(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: FabCircularMenu(
            fabOpenIcon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            fabCloseIcon: Icon(
              Icons.close,
              color: Colors.white,
            ),
            ringDiameter: size.width * 0.45,
            fabSize: 60,
            ringColor: HexColor('#1E264A'),
            ringWidth: size.width * 0.1,
            children: <Widget>[
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, 'ventas');
                    print('Home');
                  }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.pushNamed(context, 'ventasIndividual');

                    print('Favorite');
                  })
            ]),
      ),

      //  FloatingActionButton(
      //   child: Icon(Icons.add),
      //   backgroundColor: HexColor('#1E264A'),
      //   onPressed: () {},
      // ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 180,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Modulo1Page(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 0
                              ? HexColor('#1E264A')
                              : Colors.grey,
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            color: currentTab == 0
                                ? HexColor('#1E264A')
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            GraficasModulo1(); // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat,
                          color: currentTab == 1
                              ? HexColor('#1E264A')
                              : Colors.grey,
                        ),
                        Text(
                          'Graficas',
                          style: TextStyle(
                            color: currentTab == 1
                                ? HexColor('#1E264A')
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            TablasModulo1(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.dashboard,
                          color: currentTab == 2
                              ? HexColor('#1E264A')
                              : Colors.grey,
                        ),
                        Text(
                          'Tablas',
                          style: TextStyle(
                            color: currentTab == 2
                                ? HexColor('#1E264A')
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right Tab bar icons
            ],
          ),
        ),
      ),
    );
  }
}
