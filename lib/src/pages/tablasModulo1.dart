import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';

class TablasModulo1 extends StatefulWidget {
  @override
  _TablasModulo1State createState() => _TablasModulo1State();
}

class _TablasModulo1State extends State<TablasModulo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Tablas')),
      body: SingleChildScrollView(
        child: _mostrarTabla(),
      ),
    );
  }

  _mostrarTabla() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: Colors.grey[300],
          ),
          child: _crearDataTable(),
        ),
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
              DataCell(Text('Individual'), showEditIcon: true),
            ]),
            DataRow(cells: [
              DataCell(Text('Comunix a')),
              DataCell(Text('2019')),
              DataCell(Text('Individual'), showEditIcon: true),
            ]),
            DataRow(cells: [
              DataCell(Text('Comunix b')),
              DataCell(Text('2020')),
              DataCell(Text('Individual'), showEditIcon: true),
            ]),
          ]),
    );
  }
}
