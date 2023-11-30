import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/provider/api_provider_dad.dart';
import 'package:flutter_application_1/provider/api_provider_geek.dart';
import 'package:flutter_application_1/screens/jokes.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DadJokeProvider dadJokeProvider = DadJokeProvider();
  GeekApiProvider geekApiProvider = GeekApiProvider();
  late Database database;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  Future<void> _getDadJoke() async {
    await dadJokeProvider.getDadJoke();
  }

  Future<void> _getGeekJoke() async {
    await geekApiProvider.getJoke();
  }

  @override
  void initState() {
    super.initState();
    _getDadJoke();
    _getGeekJoke();
  }

   @override
  void didUpdateWidget(covariant Home oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    database = Provider.of<Database>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: FutureBuilder<RankedJoke>(
        future: database.getBestJoke(), // Debe ser una función asíncrona que devuelve un Future<RankedJoke>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Mientras se está cargando la información, puedes mostrar un indicador de carga.
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            // Si hay datos, muestra el payaso.
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://emojiisland.com/cdn/shop/products/Emoji_Icon_-_Clown_emoji_large.png?v=1571606089",
                    scale: 4.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      snapshot.data!.content,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Rating: ",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        snapshot.data!.rating.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Icon(Icons.star, color: Colors.yellow)
                    ],
                  ),
                ],
              ),
            );
          } else {
            // Si no hay datos, muestra un texto.
            return const Center(
              child: Text("No jokes yet!"),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Jokes(),
            ),);
            setState(() {});
        },
        child: const Text("Jokes"),
      ),
    );
  }
}