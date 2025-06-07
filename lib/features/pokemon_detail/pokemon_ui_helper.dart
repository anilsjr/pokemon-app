// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pokemon_app/core/theme/colors.dart';
// import 'package:pokemon_app/core/utils/pokemon_type_colors.dart';

// /// A helper class for managing Pokemon detail UI features
// class PokemonUIHelper {
//   /// Updates system UI overlay style based on Pokemon type
//   static void updateSystemUIOverlayStyle(String pokemonType) {
//     final Color typeColor = PokemonTypeColor.getColor(pokemonType);

//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarIconBrightness:
//             typeColor.computeLuminance() > 0.5
//                 ? Brightness.dark
//                 : Brightness.light,
//         systemNavigationBarColor: typeColor,
//         systemNavigationBarIconBrightness:
//             typeColor.computeLuminance() > 0.5
//                 ? Brightness.dark
//                 : Brightness.light,
//       ),
//     );
//   }

//   /// Creates a decorative pattern background
//   static Widget buildPatternBackground({
//     required Color color,
//     double opacity = 0.05,
//   }) {
//     return Positioned.fill(
//       child: Opacity(
//         opacity: opacity,
//         child: Image.asset(
//           'assets/pattern_bg.jpg',
//           repeat: ImageRepeat.repeat,
//           color: Colors.white,
//           colorBlendMode: BlendMode.srcIn,
//         ),
//       ),
//     );
//   }

//   /// Creates a Pokeball background decoration
//   static Widget buildPokeballDecoration({
//     double size = 200,
//     double opacity = 0.1,
//     Alignment alignment = Alignment.topRight,
//     double offsetX = 50,
//     double offsetY = -50,
//   }) {
//     return Positioned(
//       right: offsetX,
//       top: offsetY,
//       child: Opacity(
//         opacity: opacity,
//         child: Image.asset(
//           'assets/pokeball_bg.png',
//           width: size,
//           height: size,
//           color: Colors.white,
//         ),
//       ),
//     );
//   }
// }
