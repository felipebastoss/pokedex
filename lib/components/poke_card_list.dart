import 'package:flutter/material.dart';
import 'package:pokedex/components/poke_card.dart';
import 'package:pokedex/services/poke_async_request.dart';

class PokeCardList {
  Future<List<Widget>> getPokeCardList() async {
    List<Widget> pokeCardList = [];
    List<Map> pokeData = await PokeData().getApiList();
    for (int i = 0; i < pokeData.length; i++) {
      int colorIndex = i % 4;
      String type2;
      try {
        type2 = pokeData[i]['types'][1]['type']['name'];
      } catch (e) {
        type2 = 'Unknown';
        print("Deu erro");
      }

      pokeCardList.add(
        PokeCard(
          selector: 0,
          img: pokeData[i]['sprites']['front_default'],
          name: pokeData[i]['name'],
          exp: pokeData[i]['base_experience'],
          colorIndex: colorIndex,
          hp: pokeData[i]['stats'][0]['base_stat'],
          atk: pokeData[i]['stats'][1]['base_stat'],
          def: pokeData[i]['stats'][2]['base_stat'],
          spd: pokeData[i]['stats'][5]['base_stat'],
          type1: pokeData[i]['types'][0]['type']['name'],
          type2: type2,
        ),
      );
    }
    return pokeCardList;
  }
}
