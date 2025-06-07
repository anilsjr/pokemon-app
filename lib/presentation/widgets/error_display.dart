// import 'package:flutter/material.dart';
// import 'package:pokemon_app/core/theme/colors.dart';

// class ErrorDisplay extends StatelessWidget {
//   final String message;
//   final VoidCallback? onRetry;

//   const ErrorDisplay({Key? key, required this.message, this.onRetry})
//     : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(Icons.error_outline, size: 48, color: AppColors.accentRed),
//             const SizedBox(height: 16),
//             Text(
//               message,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: AppColors.textPrimary,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             if (onRetry != null) ...[
//               const SizedBox(height: 24),
//               ElevatedButton.icon(
//                 onPressed: onRetry,
//                 icon: const Icon(Icons.refresh),
//                 label: const Text('Retry'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppColors.accentAqua,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 24,
//                     vertical: 12,
//                   ),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
