import 'networking.dart';

const url = 'https://pokeapi.co/api/v2/pokemon';

// void main() async {
//   List<Map> data;
//   data = await PokeData().getApiList();
//   for (int i = 0; i < data.length; i++) {
//     print(data[i]['name']);
//   }
//   // print(data.length);
//   // print(data[0]['name']);
//   // print(data[1]['name']);
//   // print(data[2]['name']);
//   // print(data[3]['name']);
//   // print(data[4]['name']);
//   // print(data[5]['name']);
//   // print(data[6]['name']);
//   // print(data[7]['name']);
//   // print(data[8]['name']);
// }

class PokeData {
  Future<List<Map>> getApiList() async {
    List<String> ids = [];
    for (int i = 1; i < 899; i++) {
      ids.add(i.toString());
    }
    final result = await Future.wait(
      ids.map((id) => NetworkHelper('$url/$id').getData()),
      //
      //
      //NetworkHelper('$url/${ids[0]}').getData()
    );

    return result;
  }
}
