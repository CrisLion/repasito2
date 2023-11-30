import 'package:flutter_application_1/models/geek_joke_response.dart';
import 'package:http/http.dart' as http;

class GeekApiProvider {

  final url = "https://geek-jokes.sameerkumar.website/api?format=json";

  late GeekJokeResponse jokeResponse;

  Future<GeekJokeResponse> getJoke() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) {
      throw Exception("Failed to load data");
    }
    else {
      print(response.body);
      jokeResponse = geekJokeResponseFromJson(response.body);
    }
    return jokeResponse;
  }

}