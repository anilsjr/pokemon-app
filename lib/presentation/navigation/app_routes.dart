import 'package:flutter/material.dart';
import 'package:pokemon_app/core/constants/app_constants.dart';
import 'package:pokemon_app/data/models/pokemon_model.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/presentation/screens/home_screen.dart';
import 'package:pokemon_app/presentation/screens/pokemon_detail_screen.dart';
import 'package:pokemon_app/presentation/screens/splash_screen.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppConstants.splashRoute:
        final repository = settings.arguments as PokemonRepository?;
        return MaterialPageRoute(.config/instructions
          builder:
              (_) => SplashScreen(
                pokemonRepository: repository ?? PokemonRepository(),
              ),
        );

      case AppConstants.homeRoute:
        final pokemonList = settings.arguments as List<Pokemon>?;
        return MaterialPageRoute(
          builder: (_) => HomeScreen(pokemonList: pokemonList ?? []),
        );

      case AppConstants.detailRoute:
        final pokemon = settings.arguments as Pokemon;
        return MaterialPageRoute(
          builder: (_) => PokemonDetailScreen(pokemon: pokemon),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
