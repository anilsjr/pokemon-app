import 'package:flutter/material.dart';
import 'package:pokemon_app/core/theme/colors.dart';

class TypeBadge extends StatelessWidget {
  final String type;

  const TypeBadge({Key? key, required this.type}) : super(key: key);

  Color _getColorForType(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'poison':
        return Colors.purple;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'electric':
        return Colors.yellow;
      case 'rock':
        return Colors.brown;
      case 'ground':
        return Colors.brown.shade300;
      case 'psychic':
        return Colors.pink;
      case 'fighting':
        return Colors.orange.shade800;
      case 'bug':
        return Colors.lightGreen;
      case 'ghost':
        return Colors.indigo;
      case 'normal':
        return Colors.grey;
      case 'dragon':
        return Colors.deepPurple;
      case 'ice':
        return Colors.lightBlue;
      case 'dark':
        return Colors.black87;
      case 'fairy':
        return Colors.pinkAccent;
      case 'steel':
        return Colors.blueGrey;
      case 'flying':
        return Colors.lightBlueAccent;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: _getColorForType(type).withOpacity(0.8),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: _getColorForType(type).withOpacity(0.4),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Text(
        type.toUpperCase(),
        style: TextStyle(
          color:
              _getColorForType(type).computeLuminance() > 0.5
                  ? Colors.black
                  : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }
}
