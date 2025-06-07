import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon_app/data/models/pokemon_model.dart';

class PokemonApiService {
  final String _baseUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  /// Fetches Pokemon data from the remote JSON source.
  /// Returns a List of Pokemon objects.
  Future<List<Pokemon>> fetchPokemonList() async {
    Uri uri = Uri.parse(_baseUrl);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        Map<String, dynamic> decodedData = jsonDecode(response.body);
        List<dynamic> pokemonJsonList = decodedData['pokemon'] ?? [];

        return pokemonJsonList
            .map<Pokemon>((json) => Pokemon.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load Pokemon data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Pokemon data: $e');
    }
  }

  /// Fetches raw Pokemon data from the remote JSON source.
  /// Returns a Map containing the decoded JSON data.
  /// This is kept for backward compatibility with existing code.
  Future<Map<String, dynamic>> fetchRawPokemonData() async {
    Uri uri = Uri.parse(_baseUrl);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to load Pokemon data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching Pokemon data: $e');
    }
  }
}
