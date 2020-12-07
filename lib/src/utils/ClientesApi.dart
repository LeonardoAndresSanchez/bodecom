class ClientesApi {
  String idCliente;
  String identificacion;
  String primerNombre;
  String segundoNombre;
  String primerApellido;
  String segundoApellido;
  String lineaProductiva;
  String vereda;
  String municipio;

  ClientesApi(
      {this.idCliente,
      this.identificacion,
      this.primerNombre,
      this.segundoNombre,
      this.primerApellido,
      this.segundoApellido,
      this.lineaProductiva,
      this.vereda,
      this.municipio});

  ClientesApi.fromJson(Map<String, dynamic> json) {
    idCliente = json['id_cliente'];
    identificacion = json['identificacion'];
    primerNombre = json['primer_nombre'];
    segundoNombre = json['segundo_nombre'];
    primerApellido = json['primer_apellido'];
    segundoApellido = json['segundo_apellido'];
    lineaProductiva = json['linea_productiva'];
    vereda = json['vereda'];
    municipio = json['municipio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_cliente'] = this.idCliente;
    data['identificacion'] = this.identificacion;
    data['primer_nombre'] = this.primerNombre;
    data['segundo_nombre'] = this.segundoNombre;
    data['primer_apellido'] = this.primerApellido;
    data['segundo_apellido'] = this.segundoApellido;
    data['linea_productiva'] = this.lineaProductiva;
    data['vereda'] = this.vereda;
    data['municipio'] = this.municipio;
    return data;
  }
}
