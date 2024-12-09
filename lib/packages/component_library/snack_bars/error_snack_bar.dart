import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/gap/src/horizontal_gap.dart';
import 'package:mira/packages/component_library/l10n/component_library_localizations.dart';
import 'package:mira/packages/component_library/theme/theme.dart';


class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    super.key,
    this.message,
    required this.context,
  }) : super(
          content: ErrorSnackBarContent(
            message: message,
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFFFFF0ED),
        );

  final String? message;
  final BuildContext context;
}

class ErrorSnackBarContent extends StatelessWidget {
  const ErrorSnackBarContent({
    super.key,
    this.message,
  });

  final String? message;

  @override
  Widget build(BuildContext context) {
    final theme = MiraTheme.of(context);
    final colorScheme = theme.materialThemeData.colorScheme;
    final l10n = ComponentLibraryLocalizations.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          color: colorScheme.error,
        ),
        HorizontalGap.small(),
        Expanded(
          child: Text(
            message ?? l10n.generalExceptionMessage,
            style: theme.materialThemeData.textTheme.titleSmall?.copyWith(
              color: colorScheme.error,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
