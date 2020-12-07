class UsuarioProyectosApi {
  String idproyecto;

  UsuarioProyectosApi({this.idproyecto});

  UsuarioProyectosApi.fromJson(Map<String, dynamic> json) {
    idproyecto = json['idproyecto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idproyecto'] = this.idproyecto;
    return data;
  }
}
