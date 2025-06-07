// import 'package:flutter/material.dart';
// import 'package:pokemon_app/core/theme/colors.dart';

// /// A base widget class to provide consistent behavior and styling
// /// across different parts of the application
// class BaseWidget extends StatelessWidget {
//   final Widget child;
//   final String? title;
//   final bool showBackButton;
//   final List<Widget>? actions;
//   final Widget? floatingActionButton;
//   final Color? backgroundColor;
//   final Widget? bottomNavigationBar;
//   final PreferredSizeWidget? customAppBar;

//   const BaseWidget({
//     Key? key,
//     required this.child,
//     this.title,
//     this.showBackButton = false,
//     this.actions,
//     this.floatingActionButton,
//     this.backgroundColor,
//     this.bottomNavigationBar,
//     this.customAppBar,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor ?? AppColors.backgroundDark,
//       appBar: customAppBar ?? _buildAppBar(context),
//       body: SafeArea(child: child),
//       floatingActionButton: floatingActionButton,
//       bottomNavigationBar: bottomNavigationBar,
//     );
//   }

//   PreferredSizeWidget? _buildAppBar(BuildContext context) {
//     if (title == null &&
//         !showBackButton &&
//         (actions == null || actions!.isEmpty)) {
//       return null;
//     }

//     return AppBar(
//       title: title != null ? Text(title!) : null,
//       automaticallyImplyLeading: showBackButton,
//       actions: actions,
//       elevation: 0,
//       backgroundColor: Colors.transparent,
//     );
//   }
// }
