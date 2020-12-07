class Clientes105Api {
  String idCliente;
  String identificacion;
  String nombreParticipante;
  String grupoEtnico;
  String vereda;
  String municipio;
  String depto;

  Clientes105Api(
      {this.idCliente,
      this.identificacion,
      this.nombreParticipante,
      this.grupoEtnico,
      this.vereda,
      this.municipio,
      this.depto});

  Clientes105Api.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    identificacion = json['identificacion'];
    nombreParticipante = json['nombre_participante'];
    grupoEtnico = json['grupo_etnico'];
    vereda = json['vereda'];
    municipio = json['municipio'];
    depto = json['depto'];
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
    return data;
  }
}
