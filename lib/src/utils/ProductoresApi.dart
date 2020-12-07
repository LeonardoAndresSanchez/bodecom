class ProductoresApi {
  String idProductor;
  String identificacion;
  String nombreproductor;
  String genero;
  String edad;

  ProductoresApi(
      {this.idProductor,
      this.identificacion,
      this.nombreproductor,
      this.genero,
      this.edad});

  ProductoresApi.fromJson(Map<String, dynamic> json) {
    idProductor = json['id_productor'];
    identificacion = json['identificacion'];
    nombreproductor = json['nombreproductor'];
    genero = json['genero'];
    edad = json['edad'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_productor'] = this.idProductor;
    data['identificacion'] = this.identificacion;
    data['nombreproductor'] = this.nombreproductor;
    data['genero'] = this.genero;
    data['edad'] = this.edad;
    return data;
  }
}
