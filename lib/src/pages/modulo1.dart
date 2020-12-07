import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
// import 'package:slider_button/slider_button.dart';

class Modulo1Page extends StatefulWidget {
  @override
  _Modulo1PageState createState() => _Modulo1PageState();
  final String title = '';
}

class _Modulo1PageState extends State<Modulo1Page> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final List<String> imgList = [
    'ventas x mes',
    'ventas x dia',
    'producto comercializado',
    'ventas x participantes',
    'ventas 5',
    'ventas 6'
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();

  int touchedIndex;
  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;

  bool estado = false;
  int touchedGroupIndex;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
  }

  bool toggleValue = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Comercializacion'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              height: size.height * 0.04,
              child: Container(
                  width: double.infinity,
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: <Color>[
                          HexColor('#8840FF'),
                          HexColor('#329BFF'),
                        ]),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -8,
                        left: 2,
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Matriz de Comercializacion',
                              style: TextStyle(
                                  letterSpacing: 1.7,
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ))),
          _crearSliderTabalGrafica(),
          // _mostrarTabla(),
          // _mostrarGraficas(),
        ],
      ),
    );
  }

  _chart() {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        child: AspectRatio(
          aspectRatio: 1.6,
          child: PieChart(
            PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 0,
                sections: showingSections()),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 18 : 14;
      final double radius = isTouched ? 90 : 80;
      final double widgetSize = isTouched ? 45 : 35;

      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/ophthalmology-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff0293ee),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/librarian-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xfff8b250),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 16,
            title: '16%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/fitness-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff845bef),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        case 4:
          return PieChartSectionData(
            color: const Color(0xff13dA3D),
            value: 25,
            title: '25%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
            badgeWidget: _Badge(
              'assets/worker-svgrepo-com.svg',
              size: widgetSize,
              borderColor: const Color(0xff13d38e),
            ),
            badgePositionPercentageOffset: .98,
          );
        default:
          return null;
      }
    });
  }

  _chart2() {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                makeTransactionsIcon(),
                const SizedBox(
                  width: 38,
                ),
                const Text(
                  'Datos',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Text(
                  'state',
                  style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: BarChart(
                  BarChartData(
                    maxY: 20,
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (_a, _b, _c, _d) => null,
                        ),
                        touchCallback: (response) {
                          if (response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex =
                              response.spot.touchedBarGroupIndex;

                          setState(() {
                            if (response.touchInput is FlLongPressEnd ||
                                response.touchInput is FlPanEnd) {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            } else {
                              showingBarGroups = List.of(rawBarGroups);
                              if (touchedGroupIndex != -1) {
                                double sum = 0;
                                for (BarChartRodData rod
                                    in showingBarGroups[touchedGroupIndex]
                                        .barRods) {
                                  sum += rod.y;
                                }
                                final avg = sum /
                                    showingBarGroups[touchedGroupIndex]
                                        .barRods
                                        .length;

                                showingBarGroups[touchedGroupIndex] =
                                    showingBarGroups[touchedGroupIndex]
                                        .copyWith(
                                  barRods: showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .map((rod) {
                                    return rod.copyWith(y: avg);
                                  }).toList(),
                                );
                              }
                            }
                          });
                        }),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        margin: 20,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Mn';
                            case 1:
                              return 'Te';
                            case 2:
                              return 'Wd';
                            case 3:
                              return 'Tu';
                            case 4:
                              return 'Fr';
                            case 5:
                              return 'St';
                            case 6:
                              return 'Sn';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: SideTitles(
                        showTitles: true,
                        getTextStyles: (value) => const TextStyle(
                            color: Color(0xff7589a2),
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                        margin: 35,
                        reservedSize: 14,
                        getTitles: (value) {
                          if (value == 0) {
                            return '10U';
                          } else if (value == 10) {
                            return '50U';
                          } else if (value == 19) {
                            return '100U';
                          } else {
                            return '';
                          }
                        },
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  _mostrarTabla() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.grey[300],
        ),
        child: _crearDataTable(),
      ),
    );
  }

  _crearDataTable() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      child: DataTable(
          columnSpacing: 35,
          dataRowHeight: 40,
          headingRowHeight: 40,
          sortColumnIndex: 2,
          dividerThickness: 1,
          headingTextStyle:
              TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered))
              return Theme.of(context).colorScheme.primary.withOpacity(0.08);
            return HexColor('#1E264A'); // Use the default value.
          }),
          columns: [
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Año')),
            DataColumn(label: Text('tipo')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('Comunix')),
              DataCell(Text('2018')),
              DataCell(Text('Individual'), showEditIcon: false),
            ]),
            DataRow(cells: [
              DataCell(Text('Comunix a')),
              DataCell(Text('2019')),
              DataCell(Text('Individual'), showEditIcon: false),
            ]),
            DataRow(cells: [
              DataCell(Text('Comunix b')),
              DataCell(Text('2020')),
              DataCell(Text('Individual'), showEditIcon: false),
            ]),
          ]),
    );
  }

  _mostrarGraficas() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                color: HexColor('#1E264A'),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      HexColor('#1E264A'),
                      HexColor('#2E78EF'),
                    ])),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                  ),
                  child: Text('GRAFICA 1',
                      style: TextStyle(
                          letterSpacing: 1.7,
                          color: Colors.grey[100],
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                ),
                Container(
                  child: _chart(),
                ),
              ],
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(18.0),
        //   child: Container(
        //     decoration: BoxDecoration(
        //         color: HexColor('#1E264A'),
        //         borderRadius: BorderRadius.circular(20),
        //         gradient: LinearGradient(
        //             begin: Alignment.bottomLeft,
        //             end: Alignment.topRight,
        //             colors: <Color>[
        //               HexColor('#1E264A'),
        //               HexColor('#2E78EF'),
        //             ])),
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.only(
        //             top: 8.0,
        //           ),
        //           child: Text('GRAFICA 2',
        //               style: TextStyle(
        //                   letterSpacing: 1.7,
        //                   color: Colors.grey[100],
        //                   fontSize: 15,
        //                   fontWeight: FontWeight.w600)),
        //         ),
        //         Container(
        //           child: _chart2(),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }

  _crearSliderTabalGrafica() {
    final List<Widget> imageSliders = imgList
        .map((item) => Container(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(10.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Positioned(
                          top: 10.0,
                          bottom: 0.0,
                          left: 5.0,
                          right: 0.0,
                          child: Container(
                              child: Text(item,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600))),
                        ),
                        Positioned(
                          top: 0.0,
                          bottom: 250.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(child: _mostrarTabla()),
                        ),
                        Positioned(
                          top: 250.0,
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(child: _mostrarGraficas()),
                        ), // Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      ],
                    )),
              ),
            ))
        .toList();
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        carouselController: _controller,
        options: CarouselOptions(
            // autoPlay: true,
            // enlargeCenterPage: true,
            aspectRatio: 16 / 20,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Flexible(
          //   child: RaisedButton(
          //     onPressed: () => _controller.previousPage(),
          //     child: Text('←'),
          //   ),
          // ),
          ...Iterable<int>.generate(imgList.length).map(
            (int pageIndex) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: GestureDetector(
                  child: Container(
                    width: 30.0,
                    height: 30.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == pageIndex
                            ? HexColor('#1E264A')
                            : Colors.grey[300]),
                    child: Center(
                      child: Text("${pageIndex + 1}",
                          style: TextStyle(
                              color: _current == pageIndex
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 13)),
                    ),
                  ),
                  onTap: () => _controller.animateToPage(pageIndex),
                )),
          ),
          // Flexible(
          //   child: RaisedButton(
          //     onPressed: () => _controller.nextPage(),
          //     child: Text('→'),
          //   ),
          // ),
        ],
      )
    ]);
  }
}

BarChartGroupData makeGroupData(int x, double y1, double y2) {
  final Color leftBarColor = HexColor('#0E9E9C');
  final Color rightBarColor = HexColor('#EBE95B');
  final double width = 7;
  return BarChartGroupData(barsSpace: 4, x: x, barRods: [
    BarChartRodData(
      y: y1,
      colors: [leftBarColor],
      width: width,
    ),
    BarChartRodData(
      y: y2,
      colors: [rightBarColor],
      width: width,
    ),
  ]);
}

Widget makeTransactionsIcon() {
  const double width = 4.5;
  const double space = 3.5;
  return Row(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 42,
        color: Colors.white.withOpacity(1),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 28,
        color: Colors.white.withOpacity(0.8),
      ),
      const SizedBox(
        width: space,
      ),
      Container(
        width: width,
        height: 10,
        color: Colors.white.withOpacity(0.4),
      ),
    ],
  );
}

class _Badge extends StatelessWidget {
  final String svgAsset;
  final double size;
  final Color borderColor;

  const _Badge(
    this.svgAsset, {
    Key key,
    @required this.size,
    @required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: SvgPicture.asset(
          svgAsset,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
