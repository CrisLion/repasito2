import 'dart:convert';

GeekJokeResponse geekJokeResponseFromJson(String str) =>
    GeekJokeResponse.fromJson(json.decode(str));

String geekJokeResponseToJson(GeekJokeResponse data) => json.encode(data.toJson());

class GeekJokeResponse {
  String? joke;

  GeekJokeResponse({this.joke});

  GeekJokeResponse.fromJson(Map<String, dynamic> json) {
    joke = json['joke'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['joke'] = this.joke;
    return data;
  }
}
