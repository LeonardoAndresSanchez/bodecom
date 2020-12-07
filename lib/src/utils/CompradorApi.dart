class CompradorApi {
  String idComprador;
  String nombreComprador;
  String idTipoComprador;

  CompradorApi({this.idComprador, this.nombreComprador, this.idTipoComprador});

  CompradorApi.fromJson(Map<String, dynamic> json) {
    idComprador = json['id_comprador'];
    nombreComprador = json['nombreComprador'];
    idTipoComprador = json['id_com_tipo_comprador'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_comprador'] = this.idComprador;
    data['nombreComprador'] = this.nombreComprador;
    data['id_com_tipo_comprador'] = this.idTipoComprador;
    return data;
  }
}
