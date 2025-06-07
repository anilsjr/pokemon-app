import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokemon_app/core/theme/colors.dart';

class PokemonCardsView extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const PokemonCardsView({Key? key, required this.pokemonList})
    : super(key: key);

  @override
  State<PokemonCardsView> createState() => _PokemonCardsViewState();
}

class _PokemonCardsViewState extends State<PokemonCardsView> {
  final CardSwiperController _cardSwiperController = CardSwiperController();

  @override
  void dispose() {
    _cardSwiperController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> cards =
        widget.pokemonList
            .map((pokemon) => _buildPokemonCard(context, pokemon))
            .toList();

    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundDark),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: CardSwiper(
              controller: _cardSwiperController,
              cardsCount: cards.length,
              cardBuilder:
                  (context, index, percentThresholdX, percentThresholdY) =>
                      cards[index],
              allowedSwipeDirection: const AllowedSwipeDirection.symmetric(
                horizontal: true,
              ),
              onSwipe: (previousIndex, currentIndex, direction) {
                return true;
              },
              numberOfCardsDisplayed: 3,
              backCardOffset: const Offset(20, 20),
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
            ),
          ),
          // Controls
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: AppColors.textPrimary,
                  ),
                  onPressed: () => _cardSwiperController.undo(),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(Icons.refresh, color: AppColors.textPrimary),
                  onPressed:
                      () => _cardSwiperController.swipe(
                        CardSwiperDirection.bottom,
                      ),
                ),
                const SizedBox(width: 16.0),
                IconButton(
                  icon: const Icon(
                    Icons.arrow_forward_rounded,
                    color: AppColors.textPrimary,
                  ),
                  onPressed:
                      () =>
                          _cardSwiperController.swipe(CardSwiperDirection.top),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPokemonCard(BuildContext context, Pokemon pokemon) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonDetailScreen(pokemon: pokemon),
          ),
        );
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: _getCardColor(pokemon.type.first),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pokemon Type and Number
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      pokemon.type.first,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),

            // Pokemon Image
            Expanded(
              child: Hero(
                tag: 'pokemon-card-${pokemon.id}',
                child: CachedNetworkImage(
                  imageUrl: pokemon.img,
                  fit: BoxFit.contain,
                  height: 100,
                  width: 100,
                  placeholder:
                      (context, url) => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
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

            // Pokemon Name and Details
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pokemon.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      _buildInfoItem('Height', pokemon.height),
                      const SizedBox(width: 16.0),
                      _buildInfoItem('Weight', pokemon.weight),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Weaknesses: ${pokemon.weaknesses.join(", ")}',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12.0, color: Colors.black54),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Color _getCardColor(String type) {
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
        return Colors.blueGrey;
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
