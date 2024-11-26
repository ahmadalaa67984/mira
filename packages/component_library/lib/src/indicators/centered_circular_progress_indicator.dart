import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CenteredCircularProgressIndicator extends StatelessWidget {
  const CenteredCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = MiraTheme.of(context).materialThemeData.colorScheme;
    return Center(
      child: CircularProgressIndicator(color: colorScheme.primary),
    );
  }
}
