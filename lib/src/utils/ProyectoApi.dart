class ProyectoApi {
  String identificadorUnidad;

  ProyectoApi({this.identificadorUnidad});

  ProyectoApi.fromJson(Map<String, dynamic> json) {
    identificadorUnidad = json['identificador_unidad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identificador_unidad'] = this.identificadorUnidad;
    return data;
  }
}
