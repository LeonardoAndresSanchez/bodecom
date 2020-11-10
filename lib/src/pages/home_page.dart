import 'package:animate_do/animate_do.dart';
import 'package:bodecom/src/animations/animations.dart';
import 'package:bodecom/src/pages/menuModulo1.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:bodecom/src/blocs/provider.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imgList = [
    'Comercializacion',
    'Seguimiento',
    'Registro',
    'Indicadores',
  ];
  bool isSwitched = false;
  String reason = '';
  final CarouselController _controller = CarouselController();
  bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            // leading: Image.asset(
            //   'assets/favicon.png',
            //   height: 50,
            // ),
            centerTitle: true,
            title: Image.asset(
              'assets/logoFaoSolo.png',
              height: 50,
            ),
            elevation: 2,
            backgroundColor: HexColor('#1E264A'),
            actions: [
              IconButton(
                  icon: Image.asset(
                    'assets/iconoProyectos.png',
                    height: 100,
                  ),
                  onPressed: () {
                    _mostarAlertCustom();
                    print('click proyecto');
                  }),
            ],
          ),
          drawer: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 40),
            child: Container(
              width: size.width * 0.70,
              decoration: BoxDecoration(
                // color: HexColor('#1E264A'),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      HexColor('#445CFF'),
                      HexColor('#313D9C'),
                      // HexColor('#222550'),
                      HexColor('#1E264A'),
                    ]),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(15),
                    topRight: Radius.circular(15)),
              ),
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      DrawerHeader(
                        // padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(15)),
                          color: Colors.white,
                        ),
                        child: Container(
                          height: size.height * 0.15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Image.asset(
                                    'assets/logoBodecom.png',
                                    width: 200,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        // leading: Image.asset('assets/icon_perfil1.png', width: 30.0),
                        title: Text(
                          'Actividades de Juego',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // onTap: () => Navigator.of(context).pushNamed('inicio'),
                        // onTap: () => _juegoAleatorio(),
                      ),
                      ListTile(
                        // leading: Image.asset('assets/icon_perfil2.png', width: 30.0),
                        title: Text(
                          'Catálogo de Premios',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // onTap: () => Navigator.of(context).pushNamed('catalogo'),
                      ),
                      ListTile(
                        // leading: Image.asset('assets/icon_perfil4.png', width: 30.0),
                        title: Text(
                          'Registra tu factura',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // onTap: () => Navigator.of(context).pushNamed('factura'),
                      ),
                      ListTile(
                        // leading: Image.asset('assets/icon_perfil6.png', width: 30.0),
                        title: Text(
                          'Mensajes',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        // onTap: () => _mostarAlertCustom(),
                        // onTap: () => Navigator.of(context).pushNamed('preguntas2'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ListTile(
                            // leading:
                            // Image.asset('assets/terminos.png', width: 30.0),
                            title: Text(
                              'Cerrar sesión',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            // onTap: () =>
                            // Navigator.of(context).pushNamed('terminos'),
                            // onTap: () => Navigator.of(context).pushNamed('inicioPage'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            // fit: StackFit.expand,
            children: [
              _crearFondo(context),
              _crearContenHome(),
            ],
          ),
        )
      ],
    );
  }

  _contentHomePage(context, item) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        switch (item) {
          case 'Comercializacion':
            // Navigator.pushNamed(context, 'menuModulo1');
            // Navigator.pushNamed(context, 'modulo1');
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, anotherAnimation) {
                  return MenuModulo1();
                },
                transitionDuration: Duration(milliseconds: 1200),
                transitionsBuilder:
                    (context, animation, anotherAnimation, child) {
                  animation = CurvedAnimation(
                      curve: Curves.decelerate, parent: animation);
                  return SlideTransition(
                    position:
                        Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
                            .animate(animation),
                    child: child,
                  );
                }));
            break;
          default:
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              width: size.width * 0.85,
              // margin: EdgeInsets.symmetric(vertical: 10.0),
              // padding: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                  // color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: <Color>[
                        HexColor('#329BFF'),
                        HexColor('#8840FF'),
                      ]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 1.0,
                      offset: Offset(0.5, 0.0),
                      spreadRadius: 0.5,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 35.0),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 110,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              bottomRight: Radius.circular(50))),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/icons/iconoTarjetas.png',
                          height: 70,
                        ),

                        // size: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Matriz de' + '\n' + item,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: HexColor('#2CBEFF'),
                                ),
                              ),
                              Text(
                                'No. Documentos',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  letterSpacing: 0.4,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _crearCarousel() {
    final List<Widget> imageSliders = imgList
        .map(
          (item) => Container(
            child: Container(
                decoration: BoxDecoration(
                    // color: HexColor('#2E78EF'),
                    borderRadius: BorderRadius.circular(8)),
                // margin: EdgeInsets.all(5.0),
                child: Stack(
                  children: <Widget>[
                    _contentHomePage(context, item),
                  ],
                )),
          ),
        )
        .toList();
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 16 / 8,
              onPageChanged: onPageChange,
              autoPlay: true,
            ),
            carouselController: _controller,
          ),
        ),
        Positioned(
          left: 3,
          top: 50,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: RaisedButton(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                // side: BorderSide(color: Colors.red),
              ),
              onPressed: () => _controller.previousPage(),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          right: 3,
          top: 50,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: RaisedButton(
              color: Colors.transparent,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                // side: BorderSide(color: Colors.red),
              ),
              onPressed: () => _controller.nextPage(),
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Center(
        //   child: Column(
        //     children: [
        //       Text('page change reason: '),
        //       Text(reason),
        //     ],
        //   ),
        // )
      ],
    );
  }

  _crearFondo(context) {
    final size = MediaQuery.of(context).size;
    final fondoMorado = Container(
      height: size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
          color: HexColor('#1E264A'),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                HexColor('#1E264A'),
                HexColor('#2E78EF'),
              ])),
    );

    return Stack(
      children: [
        fondoMorado,
        Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(
                    'TODA LA INFORMACIÓN DE TU ORGANIZACIÓN EN UN SOLO LUGAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              _crearCarousel(),
            ],
          ),
        ),
      ],
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      splashColor: Colors.deepPurpleAccent,
      backgroundColor: Colors.deepPurple,
      onPressed: () {
        Navigator.pushNamed(context, 'producto');
      },
      child: Icon(Icons.add),
    );
  }

  _crearContenHome() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.all(8),
                    height: 170,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 1.0,
                            offset: Offset(0.5, 0.0),
                            spreadRadius: 0.5,
                          )
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comercialización',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey[600],
                            ),
                          ),
                          Text(
                            'Proyecto No. 00',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: HexColor('#2E78EF'),
                            ),
                          ),
                          Text(
                            '2.500',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5,
                              color: HexColor('#2E78EF'),
                            ),
                          ),
                          Text(
                            'Trabajos en ejecución',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
              _crearGrafica(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1.0,
                    offset: Offset(0.5, 0.0),
                    spreadRadius: 0.5,
                  )
                ]),
            width: double.infinity,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Informe No.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: HexColor('#584691'),
                        ),
                      ),
                      Text(
                        '05',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: HexColor('#2E78EF'),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    color: HexColor('#584691'),
                    thickness: 2,
                  ),
                ),
                // Container(
                //   width: 1,
                //   height: double.maxFinite,
                //   color: Colors.grey,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Título de informe',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                      Text(
                        'Estado de Informe: Pendiente',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Text(
                          '29 Sep',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            // letterSpacing: ,
                            color: HexColor('#2E78EF'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      HexColor('#3C345F'),
                      HexColor('#291E43'),
                    ]),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1.0,
                    offset: Offset(0.5, 0.0),
                    spreadRadius: 0.5,
                  )
                ]),
            width: double.infinity,
            height: 90,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Informe No.',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                      Text(
                        '05',
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.5,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VerticalDivider(
                    color: Colors.white,
                    thickness: 2,
                  ),
                ),
                // Container(
                //   width: 1,
                //   height: double.maxFinite,
                //   color: Colors.grey,
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Título de informe',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[200],
                        ),
                      ),
                      Text(
                        'Estado de Informe: Pendiente',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[200],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100.0),
                        child: Text(
                          '29 Sep',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              // letterSpacing: ,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  _crearGrafica() {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1.1,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: [
                Color(0xff2c274c),
                Color(0xff46426c),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'FAO 2020',
                    style: TextStyle(
                      color: Color(0xff827daa),
                      fontSize: 11,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Ventas Mes',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0, left: 6.0),
                      child: LineChart(
                        isShowingMainData ? sampleData1() : sampleData2(),
                        swapAnimationDuration:
                            const Duration(milliseconds: 250),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.refresh,
                  size: 18,
                  color:
                      Colors.white.withOpacity(isShowingMainData ? 1.0 : 0.5),
                ),
                onPressed: () {
                  setState(() {
                    isShowingMainData = !isShowingMainData;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  LineChartData sampleData1() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Color(0xff4e4965),
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 0,
      maxX: 14,
      maxY: 4,
      minY: 0,
      lineBarsData: linesBarData1(),
    );
  }

  List<LineChartBarData> linesBarData1() {
    final LineChartBarData lineChartBarData1 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 1.5),
        FlSpot(5, 1.4),
        FlSpot(7, 3.4),
        FlSpot(10, 2),
        FlSpot(12, 2.2),
        FlSpot(13, 1.8),
      ],
      isCurved: true,
      colors: [
        const Color(0xff4af699),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    final LineChartBarData lineChartBarData2 = LineChartBarData(
      spots: [
        FlSpot(1, 1),
        FlSpot(3, 2.8),
        FlSpot(7, 1.2),
        FlSpot(10, 2.8),
        FlSpot(12, 2.6),
        FlSpot(13, 3.9),
      ],
      isCurved: true,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(show: false, colors: [
        const Color(0x00aa4cfc),
      ]),
    );
    final LineChartBarData lineChartBarData3 = LineChartBarData(
      spots: [
        FlSpot(1, 2.8),
        FlSpot(3, 1.9),
        FlSpot(6, 3),
        FlSpot(10, 1.3),
        FlSpot(13, 2.5),
      ],
      isCurved: true,
      colors: const [
        Color(0xff27b6fc),
      ],
      barWidth: 8,
      isStrokeCapRound: true,
      dotData: FlDotData(
        show: false,
      ),
      belowBarData: BarAreaData(
        show: false,
      ),
    );
    return [
      lineChartBarData1,
      lineChartBarData2,
      lineChartBarData3,
    ];
  }

  LineChartData sampleData2() {
    return LineChartData(
      lineTouchData: LineTouchData(
        enabled: false,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 15,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff72719b),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          margin: 10,
          getTitles: (value) {
            switch (value.toInt()) {
              case 2:
                return 'SEPT';
              case 7:
                return 'OCT';
              case 12:
                return 'DEC';
            }
            return '';
          },
        ),
        leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
            color: Color(0xff75729e),
            fontWeight: FontWeight.bold,
            fontSize: 8,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '1m';
              case 2:
                return '2m';
              case 3:
                return '3m';
              case 4:
                return '5m';
              case 5:
                return '6m';
            }
            return '';
          },
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: const Border(
            bottom: BorderSide(
              color: Color(0xff4e4965),
              width: 4,
            ),
            left: BorderSide(
              color: Colors.transparent,
            ),
            right: BorderSide(
              color: Colors.transparent,
            ),
            top: BorderSide(
              color: Colors.transparent,
            ),
          )),
      minX: 0,
      maxX: 14,
      maxY: 6,
      minY: 0,
      lineBarsData: linesBarData2(),
    );
  }

  List<LineChartBarData> linesBarData2() {
    return [
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 4),
          FlSpot(5, 1.8),
          FlSpot(7, 5),
          FlSpot(10, 2),
          FlSpot(12, 2.2),
          FlSpot(13, 1.8),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x444af699),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 1),
          FlSpot(3, 2.8),
          FlSpot(7, 1.2),
          FlSpot(10, 2.8),
          FlSpot(12, 2.6),
          FlSpot(13, 3.9),
        ],
        isCurved: true,
        colors: const [
          Color(0x99aa4cfc),
        ],
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(
          show: false,
        ),
        belowBarData: BarAreaData(show: true, colors: [
          const Color(0x33aa4cfc),
        ]),
      ),
      LineChartBarData(
        spots: [
          FlSpot(1, 3.8),
          FlSpot(3, 1.9),
          FlSpot(6, 5),
          FlSpot(10, 3.3),
          FlSpot(13, 4.5),
        ],
        isCurved: true,
        curveSmoothness: 0,
        colors: const [
          Color(0x4427b6fc),
        ],
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(
          show: false,
        ),
      ),
    ];
  }

  _mostarAlertCustom() {
    return showGeneralDialog(
      barrierColor: Colors.black38,
      context: context,
      barrierLabel: '',
      barrierDismissible: true,
      transitionDuration: Duration(milliseconds: 350),
      transitionBuilder: (context, _animation, _secondaryAnimation, _child) {
        return Animations.fromTop(_animation, _secondaryAnimation, _child);
      },
      pageBuilder: (_animation, _secondaryAnimation, _child) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: dialogContent(context));
      },
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              top: 100,
              bottom: 16,
              right: 16,
              left: 16,
            ),
            margin: EdgeInsets.only(
              top: 35,
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
                Text(
                  'PROYECTOS',
                  // style: kTextStyle1,
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PROYECTOS',
                            // style: kTextStyle1,
                          ),
                          Center(
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: HexColor('#4f5885'),
                              activeColor: HexColor('#1E264A'),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PROYECTOS',
                            // style: kTextStyle1,
                          ),
                          Center(
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: HexColor('#4f5885'),
                              activeColor: HexColor('#1E264A'),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'PROYECTOS',
                            // style: kTextStyle1,
                          ),
                          Center(
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  print(isSwitched);
                                });
                              },
                              activeTrackColor: HexColor('#4f5885'),
                              activeColor: HexColor('#1E264A'),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                        ],
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: FlatButton(
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: HexColor('#1E264A'),
                          ),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        color: HexColor('#E5E5E5'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FlatButton(
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                        color: HexColor('#1E264A'),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 16,
          right: 16,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 105.0),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      HexColor('#329BFF'),
                      HexColor('#8840FF'),
                    ]),
              ),
              child: Lottie.asset(
                'assets/char2.json',
                // repeat: true,
              ),
              // radius: 50,
            ),
          ),
        ),
      ],
    );
  }
}
