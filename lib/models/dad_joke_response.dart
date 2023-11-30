import 'dart:convert';

DadJokeResponse dadJokeResponseFromJson(String str) =>
    DadJokeResponse.fromJson(json.decode(str));

String dadJokeResponseToJson(DadJokeResponse data) => json.encode(data.toJson());

class DadJokeResponse {
  String? id;
  String? joke;
  int? status;

  DadJokeResponse({this.id, this.joke, this.status});

  DadJokeResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    joke = json['joke'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['joke'] = this.joke;
    data['status'] = this.status;
    return data;
  }
}