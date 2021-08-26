import 'package:flutter/material.dart';
import 'package:pokedex/components/poke_card_list.dart';

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  var pokemonData = Map();
  List<Widget> pokeCardList = [];

  Future<List> getPokedexList() async {
    try {
      pokeCardList = await PokeCardList().getPokeCardList();
    } catch (e) {
      print(e);
    }
    return pokeCardList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPokedexList(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFD53B47),
              title: Center(
                child: Text('Pokedex'),
                //     Image.asset(
                //   'images/pokedex_logo.png',
                //   fit: BoxFit.cover,
                // ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Wrap(
                    runAlignment: WrapAlignment.center,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: pokeCardList,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFD53B47),
              title: Center(
                child: Text('Pokedex'),
                //     Image.asset(
                //   'images/pokedex_logo.png',
                //   fit: BoxFit.cover,
                // ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD53B47)),
              ),
            ),
          );
        }
      },
    );
  }
}
