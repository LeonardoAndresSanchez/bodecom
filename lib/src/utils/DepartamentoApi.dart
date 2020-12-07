class DepartamentoApi {
  String idDeptos;
  String nombre;
  String idMapa;
  String shortLabel;
  String label;

  DepartamentoApi(
      {this.idDeptos, this.nombre, this.idMapa, this.shortLabel, this.label});

  DepartamentoApi.fromJson(Map<String, dynamic> json) {
    idDeptos = json['id_deptos'];
    nombre = json['nombre'];
    idMapa = json['id_mapa'];
    shortLabel = json['short_label'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_deptos'] = this.idDeptos;
    data['nombre'] = this.nombre;
    data['id_mapa'] = this.idMapa;
    data['short_label'] = this.shortLabel;
    data['label'] = this.label;
    return data;
  }
}
