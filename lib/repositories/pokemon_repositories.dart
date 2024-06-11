import 'package:dio/dio.dart';
import 'package:pokeworld/model/pokemon.dart';

class PokemonRepository {
  final Dio _dio = Dio();

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await _dio.get('https://pokeapi.co/api/v2/pokemon?limit=100');
    final List results = response.data['results'];

    return Future.wait(results.map((pokemon) async {
      final detailResponse = await _dio.get(pokemon['url']);
      return Pokemon.fromJson(detailResponse.data);
    }).toList());
  }
}
