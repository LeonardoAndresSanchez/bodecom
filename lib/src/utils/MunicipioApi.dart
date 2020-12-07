class MunicipioApi {
  String idMunicipio;
  String nombreMunicipio;
  String idDepto;
  String sigla;
  String idMaps;
  String shortLabel;
  String label;

  MunicipioApi(
      {this.idMunicipio,
      this.nombreMunicipio,
      this.idDepto,
      this.sigla,
      this.idMaps,
      this.shortLabel,
      this.label});

  MunicipioApi.fromJson(Map<String, dynamic> json) {
    idMunicipio = json['id_municipio'];
    nombreMunicipio = json['nombre_municipio'];
    idDepto = json['id_depto'];
    sigla = json['sigla'];
    idMaps = json['id_maps'];
    shortLabel = json['short_label'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_municipio'] = this.idMunicipio;
    data['nombre_municipio'] = this.nombreMunicipio;
    data['id_depto'] = this.idDepto;
    data['sigla'] = this.sigla;
    data['id_maps'] = this.idMaps;
    data['short_label'] = this.shortLabel;
    data['label'] = this.label;
    return data;
  }
}
