
import 'package:flutter_application_1/models/dad_joke_response.dart';
import 'package:http/http.dart' as http;


class DadJokeProvider {

  Map<String, String> requestHeaders = {
      'Accept': 'application/json'
    };

  final url = "https://icanhazdadjoke.com";

  late DadJokeResponse dadJokeResponse;

  Future<DadJokeResponse> getDadJoke() async {

    final response = await http.get(Uri.parse(url), headers: requestHeaders);

    if (response.statusCode != 200) {
      throw Exception("Failed to load data");
    }
    else {
      print(response.body);
      dadJokeResponse = dadJokeResponseFromJson(response.body);
    }
    return dadJokeResponse;

  }
  


}