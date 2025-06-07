import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokemon_app/core/theme/colors.dart';
import 'package:pokemon_app/core/utils/responsive_utils.dart';

class PokemonGridView extends StatelessWidget {
  final List<Pokemon> pokemonList;

  const PokemonGridView({Key? key, required this.pokemonList})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundDark),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        padding: ResponsiveUtils.responsivePadding(context),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ResponsiveUtils.responsiveGridCount(
            context,
          ), // Responsive grid count
          childAspectRatio: 0.80, // More height for the content
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: pokemonList.length,
        itemBuilder: (context, index) {
          final pokemon = pokemonList[index];
          return _buildPokemonGridItem(context, pokemon);
        },
      ),
    );
  }

  Widget _buildPokemonGridItem(BuildContext context, Pokemon pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(pokemon: pokemon),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 4.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pokemon image
            Expanded(
              flex: 3,
              child: Hero(
                tag: 'pokemon-grid-${pokemon.id}',
                child: CachedNetworkImage(
                  imageUrl: pokemon.img,
                  fit: BoxFit.contain,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget:
                      (context, url, error) => const Icon(
                        Icons.broken_image,
                        size: 60,
                        color: Colors.grey,
                      ),
                ),
              ),
            ),
            // Pokemon details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      pokemon.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      '#${pokemon.num}',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textSecondary,
                        fontSize: 11.0,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    SizedBox(
                      height: 16.0,
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 4.0,
                        children:
                            pokemon.type
                                .take(2) // Limit to 2 types to avoid overflow
                                .map((type) => _buildTypeChip(type))
                                .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTypeChip(String type) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
      constraints: const BoxConstraints(minWidth: 32.0),
      decoration: BoxDecoration(
        color: _getTypeColor(type),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Text(
        type,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 8.0,
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
