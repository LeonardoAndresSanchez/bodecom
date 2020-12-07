class VeredaApi {
  String idVereda;
  String nombreVereda;
  String idMunicipio;

  VeredaApi({this.idVereda, this.nombreVereda, this.idMunicipio});

  VeredaApi.fromJson(Map<String, dynamic> json) {
    idVereda = json['id_vereda'];
    nombreVereda = json['nombre_vereda'];
    idMunicipio = json['id_municipio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_vereda'] = this.idVereda;
    data['nombre_vereda'] = this.nombreVereda;
    data['id_municipio'] = this.idMunicipio;
    return data;
  }
}
