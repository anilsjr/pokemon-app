import 'package:flutter/material.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/features/pokemon_list/pokemon_list_view.dart';
import 'package:pokemon_app/features/pokemon_grid/pokemon_grid_view.dart';
import 'package:pokemon_app/features/pokemon_cards/pokemon_cards_view.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail_screen.dart'
    show PokemonDetailScreen;

class HomeScreen extends StatefulWidget {
  final List<Pokemon> pokemonList;

  const HomeScreen({Key? key, required this.pokemonList}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return PokemonListView(pokemonList: widget.pokemonList);
      case 1:
        return PokemonGridView(pokemonList: widget.pokemonList);
      case 2:
        return PokemonCardsView(pokemonList: widget.pokemonList);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('Pokemon App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search functionality
              showSearch(
                context: context,
                delegate: _PokemonSearchDelegate(widget.pokemonList),
              );
            },
          ),
        ],
      ),
      body: Center(child: _getBody()),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Grid'),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_travel_rounded),
              label: 'Cards',
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonSearchDelegate extends SearchDelegate<Pokemon?> {
  final List<Pokemon> pokemonList;

  _PokemonSearchDelegate(this.pokemonList);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results =
        pokemonList.where((pokemon) {
          return pokemon.name.toLowerCase().contains(query.toLowerCase()) ||
              pokemon.num.contains(query);
        }).toList();

    if (query.isEmpty) {
      return const Center(
        child: Text('Search for a Pokemon by name or number'),
      );
    }

    if (results.isEmpty) {
      return Center(child: Text('No Pokemon found for "$query"'));
    }

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final pokemon = results[index];
        return ListTile(
          leading: Image.network(
            pokemon.img,
            width: 50,
            height: 50,
            errorBuilder:
                (context, error, stackTrace) => const Icon(Icons.broken_image),
          ),
          title: Text(pokemon.name),
          subtitle: Text('#${pokemon.num}'),
          onTap:
              () => {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => PokemonDetailScreen(pokemon: pokemon),
                  ),
                ),
              },
        );
      },
    );
  }
}
