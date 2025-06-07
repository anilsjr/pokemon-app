import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemon_app/core/constants/app_constants.dart';
import 'package:pokemon_app/core/theme/app_theme.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/presentation/navigation/app_routes.dart';
import 'package:pokemon_app/presentation/navigation/navigation_service.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Initialize repositories
  final pokemonRepository = PokemonRepository();

  runApp(MyApp(pokemonRepository: pokemonRepository));
}

class MyApp extends StatelessWidget {
  final PokemonRepository pokemonRepository;

  const MyApp({super.key, required this.pokemonRepository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: AppTheme.darkTheme,
      navigatorKey: NavigationService.navigatorKey,
      initialRoute: AppConstants.splashRoute,
      onGenerateRoute: AppRoutes.generateRoute,
      // Pass the repository to the splash screen
      onGenerateInitialRoutes: (initialRoute) {
        return [
          AppRoutes.generateRoute(
            RouteSettings(name: initialRoute, arguments: pokemonRepository),
          ),
        ];
      },
    );
  }
}

// Home screen has been moved to presentation/screens/home_screen.dart
