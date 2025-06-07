import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokemon_app/core/constants/app_constants.dart';
import 'package:pokemon_app/core/theme/colors.dart';

class LoadingDisplay extends StatelessWidget {
  final String? message;

  const LoadingDisplay({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Lottie.asset(
              AppConstants.pokemonRunLottie,
              fit: BoxFit.contain,
            ),
          ),
          if (message != null) ...[
            const SizedBox(height: 16),
            Text(
              message!,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}
