class LoginModel {
  String respuestaLogin;

  LoginModel({this.respuestaLogin});

  LoginModel.fromJson(Map<String, dynamic> json) {
    respuestaLogin = json['respuestaLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['respuestaLogin'] = this.respuestaLogin;
    return data;
  }
}
