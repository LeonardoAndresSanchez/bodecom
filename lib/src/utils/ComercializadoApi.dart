class ComercializadoApi {
  String suma;

  ComercializadoApi({this.suma});

  ComercializadoApi.fromJson(Map<String, dynamic> json) {
    suma = json['suma'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['suma'] = this.suma;
    return data;
  }
}
