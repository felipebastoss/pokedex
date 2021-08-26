import 'package:flutter/material.dart';
import 'package:pokedex/screens/pokemon_page.dart';

class PokeCard extends StatelessWidget {
  PokeCard({
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

  final List<Color> colorList = [
    Color(0xFF67A88F),
    Color(0xFFF0CF98),
    Color(0xFF498899),
    Color(0xFFD7705F),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        color: colorList[colorIndex],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              selector == 0
                  ? Image.network(img)
                  : Image.network(
                      img,
                      scale: 0.25,
                    ),
              selector == 0
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(name),
                    )
                  : Text(
                      name,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
              selector == 0
                  ? Container(
                      width: 0,
                    )
                  : type1 == null
                      ? Container(
                          width: 0,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: SizedBox(
                            height: 40,
                            width: 230,
                            child: Card(
                              color: Colors.white,
                              child: Center(
                                child: Text(
                                  type1.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                            ),
                          ),
                        ),
              selector == 0
                  ? Container(
                      width: 0,
                    )
                  : type2 == null
                      ? Container(
                          width: 0,
                        )
                      : type2 == 'Unknown'
                          ? Container(
                              width: 0,
                              height: 40,
                            )
                          : Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 40.0, top: 5),
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: Card(
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(
                                      type2.toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                              ),
                            ),
            ],
          ),
        ),
      ),
      onTap: selector == 1
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PokemonPage(
                      name: name,
                      exp: exp,
                      img: img,
                      atk: atk,
                      def: def,
                      hp: hp,
                      spd: spd,
                      type1: type1,
                      type2: type2,
                      selector: selector,
                      colorIndex: colorIndex,
                    );
                  },
                ),
              );
            },
    );
  }
}
