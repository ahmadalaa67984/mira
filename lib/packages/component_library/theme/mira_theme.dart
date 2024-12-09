import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/component_library.dart';

class MiraTheme extends InheritedWidget {
  const MiraTheme({
    required super.child,
    required BuildContext context,
    required this.lightTheme,
    required this.darkTheme,
    super.key,
  });

  final MiraThemeData lightTheme;
  final MiraThemeData darkTheme;

  @override
  bool updateShouldNotify(
    MiraTheme oldWidget,
  ) =>
      oldWidget.lightTheme != lightTheme || oldWidget.darkTheme != darkTheme;

  static MiraThemeData of(BuildContext context) {
    final MiraTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<MiraTheme>();
    assert(inheritedTheme != null, 'No MiraTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark
        ? inheritedTheme!.darkTheme
        : inheritedTheme!.lightTheme;
  }
}
