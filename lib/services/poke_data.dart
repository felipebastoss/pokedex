import 'networking.dart';
import 'package:pokedex/components/poke_card.dart';
import 'package:flutter/material.dart';

const url = 'https://pokeapi.co/api/v2/pokemon';

class PokeData {
  Future<List<Widget>> getPokeList() async {
    List<Widget> pokeCardList = [];
    for (int i = 1; i <= 100; i++) {
      String iStr = i.toString();
      int colorIndex = i % 4;
      NetworkHelper networkHelper = NetworkHelper('$url/$iStr');
      String type2;
      var pokeData = Map();
      pokeData = await networkHelper.getData();

      try {
        type2 = pokeData['types'][1]['type']['name'];
      } catch (e) {
        type2 = 'Unknown';
        print("Deu erro");
      }

      pokeCardList.add(
        PokeCard(
          selector: 0,
          img: pokeData['sprites']['front_default'],
          name: pokeData['name'],
          exp: pokeData['base_experience'],
          colorIndex: colorIndex,
          hp: pokeData['stats'][0]['base_stat'],
          atk: pokeData['stats'][1]['base_stat'],
          def: pokeData['stats'][2]['base_stat'],
          spd: pokeData['stats'][5]['base_stat'],
          type1: pokeData['types'][0]['type']['name'],
          type2: type2,
        ),
      );
    }
    return pokeCardList;
  }
}
