// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pokemon_app/core/theme/colors.dart';

// class ImageUtils {
//   /// Default image error widget
//   static Widget errorWidget({double? size}) {
//     return Container(
//       width: size,
//       height: size,
//       color: AppColors.backgroundCard,
//       child: Center(
//         child: Icon(
//           Icons.broken_image_rounded,
//           color: const Color.fromARGB(255, 40, 98, 126),
//           size: size != null ? size * 0.5 : 24,
//         ),
//       ),
//     );
//   }

//   /// Default image placeholder widget
//   static Widget placeholderWidget({double? size}) {
//     return Container(
//       width: size,
//       height: size,
//       color: AppColors.backgroundCard,
//       child: Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(AppColors.accentAqua),
//           strokeWidth: 2.0,
//         ),
//       ),
//     );
//   }

//   /// Load a cached image with standard error and placeholder handling
//   static Widget cachedImage({
//     required String imageUrl,
//     double? width,
//     double? height,
//     BoxFit fit = BoxFit.cover,
//   }) {
//     return CachedNetworkImage(
//       imageUrl: imageUrl,
//       width: width,
//       height: height,
//       fit: fit,
//       placeholder: (context, url) => placeholderWidget(size: width ?? height),
//       errorWidget: (context, url, error) => errorWidget(size: width ?? height),
//     );
//   }

//   /// Clean image URL if it contains http/https inconsistencies
//   static String sanitizeImageUrl(String url) {
//     // Some Pokemon images might have inconsistent HTTP/HTTPS URLs
//     if (url.startsWith('http://') && !url.contains('localhost')) {
//       return url.replaceFirst('http://', 'https://');
//     }
//     return url;
//   }
// }
