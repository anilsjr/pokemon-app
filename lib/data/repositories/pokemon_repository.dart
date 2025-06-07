import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/data/services/pokemon_api_service.dart';

class PokemonRepository {
  final PokemonApiService _apiService = PokemonApiService();

  // Keep an in-memory cache of Pokemon data to improve performance
  List<Pokemon>? _cachedPokemonList;

  /// Fetches Pokemon data, using the cache if available
  Future<List<Pokemon>> getPokemonList({bool forceRefresh = false}) async {
    if (_cachedPokemonList == null || forceRefresh) {
      _cachedPokemonList = await _apiService.fetchPokemonList();
    }
    return _cachedPokemonList!;
  }

  /// Fetches raw Pokemon data for backward compatibility
  Future<Map<String, dynamic>> getRawPokemonData() async {
    return await _apiService.fetchRawPokemonData();
  }

  /// Gets a specific Pokemon by ID
  Future<Pokemon?> getPokemonById(int id, {bool forceRefresh = false}) async {
    final pokemonList = await getPokemonList(forceRefresh: forceRefresh);
    try {
      return pokemonList.firstWhere((pokemon) => pokemon.id == id);
    } catch (e) {
      return null;
    }
  }

  /// Gets a specific Pokemon by name
  Future<Pokemon?> getPokemonByName(
    String name, {
    bool forceRefresh = false,
  }) async {
    final pokemonList = await getPokemonList(forceRefresh: forceRefresh);
    try {
      return pokemonList.firstWhere(
        (pokemon) => pokemon.name.toLowerCase() == name.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  /// Clears the Pokemon cache
  void clearCache() {
    _cachedPokemonList = null;
  }
}
