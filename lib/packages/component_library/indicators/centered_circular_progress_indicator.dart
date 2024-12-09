import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/theme/theme.dart';

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
