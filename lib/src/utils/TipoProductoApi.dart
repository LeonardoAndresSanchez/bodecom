class TipoProductoApi {
  String idComTipoProducto;
  String nombreTipo;

  TipoProductoApi({this.idComTipoProducto, this.nombreTipo});

  TipoProductoApi.fromJson(Map<String, dynamic> json) {
    idComTipoProducto = json['id_com_tipo_producto'];
    nombreTipo = json['nombre_tipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_com_tipo_producto'] = this.idComTipoProducto;
    data['nombre_tipo'] = this.nombreTipo;
    return data;
  }
}
