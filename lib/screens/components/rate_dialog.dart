
import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:provider/provider.dart';
import 'package:drift/drift.dart' as dr;

class RateDialog {
  final rateController = TextEditingController();

  Widget buildDialog(BuildContext context, String joke, String source, {String? jokeId}) {

    late Database database;
    database = Provider.of<Database>(context);

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(joke),
          TextField(
            controller: rateController,
            decoration: const InputDecoration(
              hintText: "Rate the joke (0-5)",
            ),
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () {
              if (jokeId != null) {
                database.insertJoke(RankedJokesCompanion(
                  content: dr.Value(joke),
                  source: dr.Value(source),
                  rating: dr.Value(int.parse(rateController.text)),
                  jokeId: dr.Value(jokeId),
                  createdAt: dr.Value(DateTime.now()),
                ));
              }else{
                database.insertJoke(RankedJokesCompanion(
                  content: dr.Value(joke),
                  source: dr.Value(source),
                  rating: dr.Value(int.parse(rateController.text)),
                  createdAt: dr.Value(DateTime.now()),
                ));
              }
              Navigator.pop(context);
            },
            child: const Text("Save rate"),)
        ],
      ),
    );

  }

}