import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:lottie/lottie.dart';
import 'package:date_format/date_format.dart';

import 'package:searchable_dropdown/searchable_dropdown.dart';

class VentasFormIndividual extends StatefulWidget {
  VentasFormIndividual({Key key}) : super(key: key);

  @override
  _VentasFormIndividualState createState() => _VentasFormIndividualState();
}

class _VentasFormIndividualState extends State<VentasFormIndividual> {
  bool asTabs = false;
  String selectedValue;
  String _fecha = '';
  var cantidad = '0';
  var precio = '0';
  int valorVenta = 000;
  // String preselectedValue = "dolor sit";
  // ExampleNumber selectedNumber;
  // List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];
  TextEditingController _inputFieldDateController = new TextEditingController();
  // static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";
  int selectedRadio, selectedRadio2;

  @override
  void initState() {
    selectedRadio = 0;
    selectedRadio2 = 0;

    String wordPair = "";
    loremIpsum
        .toLowerCase()
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Ventas Individual'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            _crearModuloUbicacion(),
            _crearModulotipoVenta(),
            _crearModuloDetalleVenta()
          ],
        )));
  }

  _crearModuloUbicacion() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 100,
                bottom: 16,
                // right: 16,
                // left: 16,
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
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // SizedBox(
                        //   height: 30.0,
                        // ),
                        Text(
                          'Ubicación',
                          style: TextStyle(
                            color: HexColor('#1E264A'),
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _crearDepartamento(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearMunicipio(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearVereda(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearFecha(context),
                        SizedBox(
                          height: 15.0,
                        ),
                      ]),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 16,
              right: 16,
              child: CircleAvatar(
                child: Image.asset(
                  'assets/favicon.png',
                  height: 80,
                ),
                backgroundColor: HexColor('#1E264A'),
                radius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _crearModulotipoVenta() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                // top: 30,
                bottom: 16,
                // right: 16,
                // left: 16,
              ),
              margin: EdgeInsets.only(
                top: 10,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            color: HexColor('#1E264A'),
                          ),
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'Rubro y Línea Productiva',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearRubroProductivo(),
                        SizedBox(
                          height: 15.0,
                        ),
                        _crearLineaProductiva(),
                        SizedBox(
                          height: 15.0,
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _crearModuloDetalleVenta() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, bottom: 25, left: 8.0, right: 8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(
                // top: 30,
                bottom: 16,
                // right: 16,
                // left: 16,
              ),
              margin: EdgeInsets.only(
                top: 10,
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12)),
                            color: HexColor('#1E264A'),
                          ),
                          height: 50,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.play_arrow_outlined,
                                color: Colors.white,
                              ),
                              Text(
                                'Detalles de venta',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        _crearDetalleVenta(),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          'Detalles Producto',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        _crearDetalleProducto(),
                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: FlatButton(
                                child: Text(
                                  'Cancelar',
                                  style: TextStyle(
                                    color: HexColor('#1E264A'),
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                color: HexColor('#E5E5E5'),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: FlatButton(
                                child: Text(
                                  'Ok',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                                color: HexColor('#1E264A'),
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.0)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        enableInteractiveSelection: false,
        controller: _inputFieldDateController,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: 'DD - MM - AAAA',
          labelText: 'DD - MM - AAAA',
          suffixIcon: Icon(
            Icons.calendar_today,
            color: HexColor('#3C345F'),
          ),
        ),
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        },
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2050),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark(), // This will change to light theme.
          child: child,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _fecha = formatDate(picked, [yyyy, '-', mm, '-', dd, '-', hh, '-', nn]);
        _inputFieldDateController.text =
            formatDate(picked, [dd, '-', mm, '-', yyyy]);
      });
    }
  }

  _crearDepartamento() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Departamento",
            searchHint: "Departamento",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            clearIcon: Icon(Icons.close),
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearMunicipio() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Municipio",
            searchHint: "Municipio",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearVereda() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Vereda",
            searchHint: "Vereda",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearRubroProductivo() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Rubro Productivo",
            searchHint: "Rubro Productivo",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearLineaProductiva() {
    return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          child: SearchableDropdown.single(
            items: items,
            value: selectedValue,
            hint: "Linea productiva",
            searchHint: "Linea productiva",
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
            isExpanded: true,
          ),
        );
      },
    );
  }

  _crearObservaciones() {
    return StreamBuilder(
        // stream: bloc.emailStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: TextField(
          // expands: true,
          maxLines: 10,
          minLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorText: snapshot.error,
            // icon: Icon(
            //   Icons.alternate_email,
            //   color: HexColor('#2E78EF'),
            // ),
            hintText: 'Observaciones',
            labelText: 'Observaciones',
            counterText: snapshot.data,
          ),
          // onChanged: bloc.changeEmail,
        ),
      );
    });
  }

  _crearDetalleVenta() {
    setSelectedRadio(int val) {
      setState(() {
        selectedRadio = val;
        selectedRadio2 = val;
      });
    }

    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Text(
            'Tipo de Apoyo',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedRadio2,
            title: Text(
              'Directo',
              style: TextStyle(
                fontSize: 16.0,
                // fontWeight: FontWeight.w700,
              ),
            ),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadio2,
            title: Text(
              'Indirecto',
              style: TextStyle(
                fontSize: 16.0,
                // fontWeight: FontWeight.w700,
              ),
            ),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          RadioListTile(
            value: 3,
            groupValue: selectedRadio2,
            title: Text(
              'Particular',
              style: TextStyle(
                fontSize: 16.0,
                // fontWeight: FontWeight.w700,
              ),
            ),
            // subtitle: Text(user.lastName),
            onChanged: (val) {
              print("Radio $val");
              setSelectedRadio(val);
            },
            // selected: selectedUser == user,
            activeColor: Colors.green,
          ),
          Text(
            'Venta con acuerdo',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Radio(
                    value: 4,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio(
                    value: 5,
                    groupValue: selectedRadio,
                    activeColor: Colors.blue,
                    onChanged: (val) {
                      print("Radio $val");
                      setSelectedRadio(val);
                    },
                  ),
                  Text(
                    'Si',
                    style: TextStyle(
                      fontSize: 16.0,
                      // fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  _crearDetalleProducto() {
    return Container(
      child: Column(
        children: [
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SearchableDropdown.single(
                  items: items,
                  value: selectedValue,
                  hint: "Producto Comercializado",
                  searchHint: "Producto Comercializado",
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  clearIcon: Icon(Icons.close),
                  isExpanded: true,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[500]),
              borderRadius: BorderRadius.circular(10.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: SearchableDropdown.single(
              items: items,
              value: selectedValue,
              hint: "Tipo de Producto",
              searchHint: "Tipo de Producto",
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              doneButton: "Hecho",
              displayItem: (item, selected) {
                return (Row(children: [
                  selected
                      ? Icon(
                          Icons.radio_button_checked,
                          color: HexColor('#3C345F'),
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: HexColor('#291E43'),
                        ),
                  SizedBox(width: 7),
                  Expanded(
                    child: item,
                  ),
                ]));
              },
              isExpanded: true,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                // expands: true,
                maxLines: 10,
                minLines: 1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorText: snapshot.error,
                  // icon: Icon(
                  //   Icons.alternate_email,
                  //   color: HexColor('#2E78EF'),
                  // ),
                  hintText: 'Lugar de entrega',
                  labelText: 'Lugar de entrega',
                  counterText: snapshot.data,
                ),
                // onChanged: bloc.changeEmail,
              ),
            );
          }),
          SizedBox(
            height: 15,
          ),
          Text(
            'Unidad de venta',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          StreamBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[500]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: SearchableDropdown.single(
                  items: items,
                  value: selectedValue,
                  hint: "Unidad de Medida",
                  searchHint: "Unidad de Medida",
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                  clearIcon: Icon(Icons.close),
                  isExpanded: true,
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  suffixIcon: Icon(
                    Icons.monetization_on,
                    color: HexColor('#3C345F'),
                  ),
                  // errorText: snapshot.error,
                  hintText: 'Precio',
                  labelText: 'Precio',
                  counterText: snapshot.data,
                ),
                onChanged: (value) {
                  precio = value;
                },
              ),
            );
          }),
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
              // stream: bloc.emailStream,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  // errorText: snapshot.error,
                  suffixIcon: Icon(
                    Icons.bar_chart_rounded,
                    color: HexColor('#3C345F'),
                  ),
                  hintText: 'Cantidad',
                  labelText: 'Cantidad',
                  counterText: snapshot.data,
                ),
                onChanged: (value) {
                  cantidad = value;
                  setState(() {
                    var p = int.parse(precio);
                    var c = int.parse(cantidad);
                    var total = (p * c);
                    valorVenta = total;
                  });
                },
              ),
            );
          }),
          SizedBox(
            height: 20,
          ),
          Text('Valor Total de La venta',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
          Text('\$ $valorVenta ',
              style: TextStyle(
                  color: Colors.green[500],
                  fontSize: 25,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
