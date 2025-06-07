// import 'package:pokemon_app/data/models/pokemon_model.dart';

// /// Service for Pokemon search functionality
// class PokemonSearchService {
//   /// Searches for Pokemon based on the given query
//   static List<Pokemon> search(List<Pokemon> pokemonList, String query) {
//     if (query.isEmpty) {
//       return pokemonList;
//     }

//     final String normalizedQuery = query.toLowerCase().trim();

//     return pokemonList.where((pokemon) {
//       // Match by name
//       final String name = pokemon.name.toLowerCase();
//       if (name.contains(normalizedQuery)) {
//         return true;
//       }

//       // Match by number
//       if (pokemon.num.contains(normalizedQuery)) {
//         return true;
//       }

//       // Match by type
//       for (final type in pokemon.type) {
//         if (type.toLowerCase().contains(normalizedQuery)) {
//           return true;
//         }
//       }

//       // Match by weakness
//       for (final weakness in pokemon.weaknesses) {
//         if (weakness.toLowerCase().contains(normalizedQuery)) {
//           return true;
//         }
//       }

//       return false;
//     }).toList();
//   }

//   /// Filters Pokemon by type
//   static List<Pokemon> filterByType(List<Pokemon> pokemonList, String type) {
//     if (type.isEmpty) {
//       return pokemonList;
//     }

//     final String normalizedType = type.toLowerCase().trim();

//     return pokemonList.where((pokemon) {
//       return pokemon.type.map((t) => t.toLowerCase()).contains(normalizedType);
//     }).toList();
//   }

//   /// Sorts Pokemon by various criteria
//   static List<Pokemon> sort(
//     List<Pokemon> pokemonList,
//     PokemonSortCriteria criteria, {
//     bool ascending = true,
//   }) {
//     final List<Pokemon> sortedList = List.from(pokemonList);

//     switch (criteria) {
//       case PokemonSortCriteria.id:
//         sortedList.sort((a, b) {
//           final int idA = int.tryParse(a.id) ?? 0;
//           final int idB = int.tryParse(b.id) ?? 0;
//           return ascending ? idA.compareTo(idB) : idB.compareTo(idA);
//         });
//         break;

//       case PokemonSortCriteria.name:
//         sortedList.sort((a, b) {
//           return ascending
//               ? a.name.compareTo(b.name)
//               : b.name.compareTo(a.name);
//         });
//         break;

//       case PokemonSortCriteria.weight:
//         sortedList.sort((a, b) {
//           final double weightA = _parseWeight(a.weight);
//           final double weightB = _parseWeight(b.weight);
//           return ascending
//               ? weightA.compareTo(weightB)
//               : weightB.compareTo(weightA);
//         });
//         break;

//       case PokemonSortCriteria.height:
//         sortedList.sort((a, b) {
//           final double heightA = _parseHeight(a.height);
//           final double heightB = _parseHeight(b.height);
//           return ascending
//               ? heightA.compareTo(heightB)
//               : heightB.compareTo(heightA);
//         });
//         break;
//     }

//     return sortedList;
//   }

//   /// Helper method to parse weight
//   static double _parseWeight(String weight) {
//     final RegExp regex = RegExp(r'(\d+\.?\d*)');
//     final match = regex.firstMatch(weight);
//     if (match != null) {
//       return double.tryParse(match.group(1) ?? '0') ?? 0;
//     }
//     return 0;
//   }

//   /// Helper method to parse height
//   static double _parseHeight(String height) {
//     final RegExp regex = RegExp(r'(\d+\.?\d*)');
//     final match = regex.firstMatch(height);
//     if (match != null) {
//       return double.tryParse(match.group(1) ?? '0') ?? 0;
//     }
//     return 0;
//   }
// }

// /// Sort criteria for Pokemon
// enum PokemonSortCriteria { id, name, height, weight }
