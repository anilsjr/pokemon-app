class AppConstants {
  // API endpoints
  static const String pokemonApiUrl =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  // Asset paths
  static const String pokemonRunLottie = 'assets/lottie/pokemon_run.json';
  static const String pokemonLottie = 'assets/lottie/pokemon.json';

  // Navigation routes
  static const String homeRoute = '/';
  static const String detailRoute = '/detail';
  static const String splashRoute = '/splash';

  // Animation durations
  static const int splashDuration = 2000; // milliseconds
  static const int standardAnimationDuration = 300; // milliseconds

  // Error messages
  static const String fetchErrorMessage = 'Failed to load Pokemon data';
  static const String networkErrorMessage = 'Please check your connection.';

  //App title
  static const String appTitle = 'Pokemon App';
  static const String appSubtitle = 'Discover your favorite Pokemon!';
}
