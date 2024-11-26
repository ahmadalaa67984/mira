// import 'package:flutter/material.dart';
// import 'package:component_library/src/component_library.dart';

// class MiraBackButton extends StatelessWidget {
//   const MiraBackButton({
//     super.key,
//     this.onBackTapped,
//   });
//
//   final VoidCallback? onBackTapped;
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = MiraTheme.of(context);
//     return GestureDetector(
//       onTap: onBackTapped ?? () => Navigator.of(context).pop(),
//       child: Container(
//         height: 32,
//         width: 32,
//         margin: const EdgeInsets.only(left: Spacing.medium),
//         decoration: BoxDecoration(
//           color: theme.iconBgColor,
//           borderRadius: BorderRadius.circular(50),
//         ),
//         child: ArrowSvgAsset(
//           color: theme.backButtonIconColor,
//         ),
//       ),
//     );
//   }
// }
