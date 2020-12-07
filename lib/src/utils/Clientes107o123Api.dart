class Clientes107o123Api {
  String idCliente;
  String identificacion;
  String nombreParticipante;
  String grupoEtnico;
  String vereda;
  String municipio;
  String depto;
  String idLineaProductiva;

  Clientes107o123Api(
      {this.idCliente,
      this.identificacion,
      this.nombreParticipante,
      this.grupoEtnico,
      this.vereda,
      this.municipio,
      this.depto,
      this.idLineaProductiva});

  Clientes107o123Api.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    identificacion = json['identificacion'];
    nombreParticipante = json['nombre_participante'];
    grupoEtnico = json['grupo_etnico'];
    vereda = json['vereda'];
    municipio = json['municipio'];
    depto = json['depto'];
    idLineaProductiva = json['id_linea_productiva'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_cliente'] = this.idCliente;
    data['identificacion'] = this.identificacion;
    data['nombre_participante'] = this.nombreParticipante;
    data['grupo_etnico'] = this.grupoEtnico;
    data['vereda'] = this.vereda;
    data['municipio'] = this.municipio;
    data['depto'] = this.depto;
    data['id_linea_productiva'] = this.idLineaProductiva;
    return data;
  }
}
