import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/core/theme/colors.dart';
import 'package:pokemon_app/presentation/widgets/type_badge.dart';
import 'package:pokemon_app/presentation/widgets/stat_bar.dart';
import 'package:pokemon_app/core/utils/pokemon_type_colors.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({Key? key, required this.pokemon})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PokemonTypeColor.getColor(
        pokemon.type.first,
      ).withOpacity(0.8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              _sharePokemon(pokemon);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background circles
          Positioned(
            top: -50,
            right: -50,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Content
          Column(
            children: [
              // Pokemon image and basic info
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  pokemon.name,
                                  style: const TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '#${pokemon.num}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white70,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // Types
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children:
                            pokemon.type
                                .map((type) => TypeBadge(type: type))
                                .toList(),
                      ),
                      const SizedBox(height: 16),
                      // Image
                      Expanded(
                        child: Center(
                          child: Hero(
                            tag: 'pokemon-${pokemon.id}',
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img,
                              fit: BoxFit.contain,
                              placeholder:
                                  (context, url) => const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                              errorWidget:
                                  (context, url, error) => const Icon(
                                    Icons.broken_image,
                                    size: 100,
                                    color: Colors.white70,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Pokemon detailed info
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24.0),
                  decoration: const BoxDecoration(
                    color: AppColors.backgroundCard,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Physical attributes
                        _buildSectionTitle('About'),
                        _buildPhysicalAttributes(),
                        const SizedBox(height: 24),

                        // Base stats
                        _buildSectionTitle('Base Stats'),
                        _buildStats(),
                        const SizedBox(height: 24),

                        // Weaknesses
                        _buildSectionTitle('Weaknesses'),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children:
                              pokemon.weaknesses
                                  .map((type) => TypeBadge(type: type))
                                  .toList(),
                        ),
                        const SizedBox(height: 24),

                        // Evolution
                        if (pokemon.nextEvolution != null ||
                            pokemon.prevEvolution != null) ...[
                          _buildSectionTitle('Evolution Chain'),
                          _buildEvolutionChain(),
                          const SizedBox(height: 24),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  Widget _buildPhysicalAttributes() {
    return Row(
      children: [
        _buildAttributeItem('Height', pokemon.height),
        _buildAttributeItem('Weight', pokemon.weight),
        _buildAttributeItem('Spawn Time', pokemon.spawnTime),
      ],
    );
  }

  Widget _buildAttributeItem(String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStats() {
    // Since we don't have actual stat values in the Pokemon model,
    // we'll create some example stats based on available data
    double spawnRatio = pokemon.spawnChance * 10;
    // Adding null check for avgSpawns
    double speedRatio = ((pokemon.avgSpawns ?? 5) / 5).clamp(0.0, 1.0);
    double defenseRatio = 0.5; // Placeholder
    double attackRatio = 0.7; // Placeholder

    // Convert ratios to integer values for StatBar (scale to 0-100 range)
    int rarityValue = (spawnRatio * 10).round();
    int speedValue = (speedRatio * 100).round();
    int defenseValue = (defenseRatio * 100).round();
    int attackValue = (attackRatio * 100).round();

    return Column(
      children: [
        StatBar(statName: 'Rarity', statValue: rarityValue),
        const SizedBox(height: 8),
        StatBar(statName: 'Speed', statValue: speedValue),
        const SizedBox(height: 8),
        StatBar(statName: 'Defense', statValue: defenseValue),
        const SizedBox(height: 8),
        StatBar(statName: 'Attack', statValue: attackValue),
      ],
    );
  }

  Widget _buildEvolutionChain() {
    List<Widget> evolutionWidgets = [];

    // Previous evolutions
    if (pokemon.prevEvolution != null) {
      for (var evolution in pokemon.prevEvolution!) {
        evolutionWidgets.add(
          Column(
            children: [
              Text(
                evolution.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '#${evolution.num}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
        evolutionWidgets.add(
          const Icon(Icons.arrow_forward, color: AppColors.accentYellow),
        );
      }
    }

    // Current Pokemon
    evolutionWidgets.add(
      Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: PokemonTypeColor.getColor(
                pokemon.type.first,
              ).withOpacity(0.2),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Text(
                  pokemon.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: PokemonTypeColor.getColor(pokemon.type.first),
                  ),
                ),
                Text(
                  '#${pokemon.num}',
                  style: TextStyle(
                    fontSize: 14,
                    color: PokemonTypeColor.getColor(pokemon.type.first),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    // Next evolutions
    if (pokemon.nextEvolution != null) {
      evolutionWidgets.add(
        const Icon(Icons.arrow_forward, color: AppColors.accentYellow),
      );
      for (var i = 0; i < pokemon.nextEvolution!.length; i++) {
        var evolution = pokemon.nextEvolution![i];
        evolutionWidgets.add(
          Column(
            children: [
              Text(
                evolution.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              Text(
                '#${evolution.num}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        );
        if (i < pokemon.nextEvolution!.length - 1) {
          evolutionWidgets.add(
            const Icon(Icons.arrow_forward, color: AppColors.accentYellow),
          );
        }
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: evolutionWidgets,
      ),
    );
  }

  void _sharePokemon(Pokemon pokemon) {
    Share.share(
      'Check out this Pokémon: ${pokemon.name} (#${pokemon.num})\n'
      'Types: ${pokemon.type.join(", ")}\n'
      'Image: ${pokemon.img}',
      subject: 'Pokémon Info: ${pokemon.name}',
    );
  }
}
