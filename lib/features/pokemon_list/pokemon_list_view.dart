import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokemon_app/core/theme/colors.dart';

class PokemonListView extends StatelessWidget {
  final List<Pokemon> pokemonList;

  const PokemonListView({super.key, required this.pokemonList});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundDark),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          // for (int idx = 0; idx < pokemonList.length; idx + 15) {
          //   index = idx + index;
          //   if (index >= pokemonList.length) {
          //     index = index - pokemonList.length;
          //   }
          // }
          return _buildPokemonCard(context, pokemon);
        },
      ),
    );
  }

  Widget _buildPokemonCard(BuildContext context, Pokemon pokemon) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(pokemon: pokemon),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 40, 45, 56),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5.0,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Pokemon image
            Hero(
              tag: 'pokemon-${pokemon.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: CachedNetworkImage(
                  imageUrl: pokemon.img,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.broken_image,
                        size: 80,
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Pokemon details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    '#${pokemon.num}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Wrap(
                    spacing: 8.0,
                    children:
                        pokemon.type.map((type) {
                          return _buildTypeChip(type);
                        }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: _getTypeColor(type),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Text(
        type,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 13.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'fire':
        return Colors.redAccent;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.amber;
      case 'rock':
        return Colors.grey;
      case 'ground':
        return Colors.brown;
      case 'psychic':
        return Colors.indigo;
      case 'fighting':
        return Colors.orange;
      case 'bug':
        return Colors.lightGreen;
      case 'ghost':
        return Colors.deepPurple;
      case 'normal':
        return Colors.black54;
      case 'poison':
        return Colors.deepPurpleAccent;
      case 'ice':
        return Colors.lightBlue;
      case 'dragon':
        return Colors.deepOrange;
      default:
        return Colors.grey;
    }
  }
}
