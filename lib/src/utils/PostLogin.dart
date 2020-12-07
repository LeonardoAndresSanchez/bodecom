import 'dart:convert';

PostLogin postFromJson(String str) {
  final jsonData = json.decode(str);
  return PostLogin.fromJson(jsonData);
}

String postToJson(PostLogin data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

List<PostLogin> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<PostLogin>.from(jsonData.map((x) => PostLogin.fromJson(x)));
}

String allPostsToJson(List<PostLogin> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class PostLogin {
  String email;
  String password;
  String body;

  PostLogin({
    this.email,
    this.password,
  });

  factory PostLogin.fromJson(Map<String, dynamic> json) => new PostLogin(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "respuestaLogin": body,
      };
}
