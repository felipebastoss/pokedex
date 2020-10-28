import 'package:flutter/material.dart';
import 'package:pokedex/components/poke_card.dart';
import 'package:pokedex/components/stats_indicator.dart';

class PokemonPage extends StatelessWidget {
  PokemonPage({
    this.hp,
    this.atk,
    this.def,
    this.exp,
    this.img,
    this.name,
    this.spd,
    this.type1,
    this.type2,
    this.colorIndex,
    this.selector,
  });

  final int hp;
  final int exp;
  final int def;
  final int spd;
  final int atk;
  final String img;
  final String name;
  final String type1;
  final String type2;
  final int colorIndex;
  final int selector;

  @override
  Widget build(BuildContext context) {
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
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                runAlignment: WrapAlignment.center,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  PokeCard(
                    selector: 1,
                    name: name,
                    img: img,
                    type1: type1,
                    type2: type2,
                    colorIndex: colorIndex,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'Base Stats',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      StatIndicator(
                        statName: 'HP ',
                        statValue: hp,
                        color: Color(0xFFD53B47),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StatIndicator(
                        statName: 'ATK',
                        statValue: atk,
                        color: Color(0xFFFBA924),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StatIndicator(
                        statName: 'DEF',
                        statValue: def,
                        color: Color(0xFF0291EF),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StatIndicator(
                        statName: 'SPD',
                        statValue: spd,
                        color: Color(0xFF91AFC6),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      StatIndicator(
                        statName: 'EXP',
                        statValue: exp,
                        color: Color(0xFF398C3C),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
