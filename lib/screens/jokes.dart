
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/dad_joke_response.dart';
import 'package:flutter_application_1/models/geek_joke_response.dart';
import 'package:flutter_application_1/provider/api_provider_dad.dart';
import 'package:flutter_application_1/provider/api_provider_geek.dart';
import 'package:flutter_application_1/screens/components/rate_dialog.dart';

class Jokes extends StatefulWidget {
  const Jokes({super.key});

  @override
  State<Jokes> createState() => _JokesState();
}

class _JokesState extends State<Jokes> {

  int dadJokesNumber = 10;
  int geekJokesNumber = 10;

  DadJokeProvider dadJokeProvider = DadJokeProvider();
  GeekApiProvider geekApiProvider = GeekApiProvider();

  List<DadJokeResponse> dadJokeResponse = [];
  List<GeekJokeResponse> geekJokeResponse = [];

  RateDialog? rateDialog;


  Future<void> _getDadJokeList() async {
    while (dadJokesNumber > 0) {
      dadJokeResponse.add(await dadJokeProvider.getDadJoke());
      dadJokesNumber--;
    }
    setState(() {
      dadJokeResponse = dadJokeResponse;
    });
  }

  Future<void> _getGeekJokeList() async {
    while (geekJokesNumber > 0) {
      geekJokeResponse.add(await geekApiProvider.getJoke());
      geekJokesNumber--;
    }
    setState(() {
      geekJokeResponse = geekJokeResponse;
    });
  }

  @override
  void initState() {
    super.initState();
    _getDadJokeList();
    _getGeekJokeList();
    rateDialog = RateDialog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jokes"),
      ),
      body: Column(
        children: [
          const Text(
            "Geek Jokes",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: geekJokeResponse == null ? 0 : geekJokeResponse.length,
              itemBuilder: (BuildContext context,index) {
                return Card(
                  child: ListTile(
                    title: Text(geekJokeResponse[index].joke!),
                    trailing: IconButton(
                      icon: const Icon(Icons.rate_review),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => rateDialog!.buildDialog(
                              context,
                              geekJokeResponse[index].joke!,
                              "Geek Jokes"
                        ));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Dad Jokes",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dadJokeResponse == null ? 0 : dadJokeResponse.length,
              itemBuilder: (BuildContext context,index) {
                return Card(
                  child: ListTile(
                    title: Text(dadJokeResponse[index].joke!),
                    trailing: IconButton(
                      icon: const Icon(Icons.rate_review),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => rateDialog!.buildDialog(
                              context,
                              dadJokeResponse[index].joke!,
                              "Dad Jokes",
                              jokeId: dadJokeResponse[index].id
                          ));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}