class PropuestasApi {
  String idPropuesta;
  String codProyecto;
  String nombrePropuesta;

  PropuestasApi({this.idPropuesta, this.codProyecto, this.nombrePropuesta});

  PropuestasApi.fromJson(Map<String, dynamic> json) {
    idPropuesta = json['id_propuesta'];
    codProyecto = json['cod_proyecto'];
    nombrePropuesta = json['nombre_propuesta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_propuesta'] = this.idPropuesta;
    data['cod_proyecto'] = this.codProyecto;
    data['nombre_propuesta'] = this.nombrePropuesta;
    return data;
  }
}
