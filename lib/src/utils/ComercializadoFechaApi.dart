class ComercializadoFechaApi {
  String suma;
  String fecha;

  ComercializadoFechaApi({this.suma, this.fecha});

  ComercializadoFechaApi.fromJson(Map<String, dynamic> json) {
    suma = json['suma'];
    fecha = json['fecha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suma'] = this.suma;
    data['fecha'] = this.fecha;
    return data;
  }
}
