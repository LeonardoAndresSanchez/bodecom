class ProductoApi {
  String idProductoComercializado;
  String nombreproducto;

  ProductoApi({this.idProductoComercializado, this.nombreproducto});

  ProductoApi.fromJson(Map<String, dynamic> json) {
    idProductoComercializado = json['id_productoComercializado'];
    nombreproducto = json['nombreproducto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_productoComercializado'] = this.idProductoComercializado;
    data['nombreproducto'] = this.nombreproducto;
    return data;
  }
}
