import 'package:flutter/material.dart';
import 'package:pokemon_app/core/theme/colors.dart';

class StatBar extends StatelessWidget {
  final String statName;
  final int statValue;
  final Color? color;
  final double maxValue;

  const StatBar({
    Key? key,
    required this.statName,
    required this.statValue,
    this.color,
    this.maxValue = 255.0, // Max base stat in Pokemon games
  }) : super(key: key);

  String _formatStatName(String name) {
    switch (name.toLowerCase()) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SP.ATK';
      case 'special-defense':
        return 'SP.DEF';
      case 'speed':
        return 'SPD';
      default:
        return name.toUpperCase();
    }
  }

  Color _getStatColor() {
    if (color != null) return color!;

    if (statValue < 50) {
      return Colors.red;
    } else if (statValue < 80) {
      return Colors.orange;
    } else if (statValue < 120) {
      return Colors.green;
    } else {
      return AppColors.accentAqua;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              _formatStatName(statName),
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 40,
            child: Text(
              statValue.toString(),
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: 8,
                  decoration: BoxDecoration(
                    color: AppColors.backgroundCard,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                FractionallySizedBox(
                  widthFactor: (statValue / maxValue).clamp(0.0, 1.0),
                  child: Container(
                    height: 8,
                    decoration: BoxDecoration(
                      color: _getStatColor(),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: [
                        BoxShadow(
                          color: _getStatColor().withOpacity(0.3),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
