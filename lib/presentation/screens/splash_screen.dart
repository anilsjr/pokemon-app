import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app/core/constants/app_constants.dart';
import 'package:pokemon_app/data/repositories/pokemon_repository.dart';
import 'package:pokemon_app/presentation/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  final PokemonRepository pokemonRepository;

  const SplashScreen({Key? key, required this.pokemonRepository})
    : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      // Wait for both Pokemon data and splash duration in parallel
      final results = await Future.wait([
        widget.pokemonRepository.getPokemonList(),
        Future.delayed(
          const Duration(milliseconds: AppConstants.splashDuration),
        ),
      ]);
      final pokemonList = results[0];

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(pokemonList: pokemonList),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _errorMessage = AppConstants.networkErrorMessage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Pokemon logo or app title
            const Text(
              AppConstants.appTitle,
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),

            // Animation
            SizedBox(
              height: 200,
              width: 200,
              child: Lottie.asset(AppConstants.pokemonRunLottie),
            ),

            const SizedBox(height: 40),

            // Loading indicator or error message
            if (_isLoading)
              const CircularProgressIndicator()
            else if (_errorMessage.isNotEmpty)
              Column(
                children: [
                  Text(
                    _errorMessage,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isLoading = true;
                        _errorMessage = '';
                      });
                      _loadData();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            Text(
              AppConstants.appSubtitle,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
