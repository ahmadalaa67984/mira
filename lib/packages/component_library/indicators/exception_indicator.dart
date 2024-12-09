import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/buttons/mira_elevated_button.dart';
import 'package:mira/packages/component_library/theme/theme.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({
    this.title,
    this.message,
    this.onTryAgain,
    this.buttonLabel,
    this.isLoading = false,
    this.verticalPadding = 32,
    this.horizontalPadding = 16,
    super.key,
  });

  final String? title;
  final String? message;
  final VoidCallback? onTryAgain;
  final String? buttonLabel;
  final bool isLoading;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 48,
            ),
            const SizedBox(
              height: Spacing.xxLarge,
            ),
            Text(title ?? 'حدث خطأ ما',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )),
            if (message != null) ...[
              const SizedBox(
                height: 16,
              ),
              Text(
                message!,
                textAlign: TextAlign.center,
              ),
            ],
            if (onTryAgain != null)
              const SizedBox(
                height: Spacing.xxxLarge,
              ),
            if (onTryAgain != null)
              isLoading
                  ? MiraElevatedButton.inProgress(
                      label: buttonLabel ?? '',
                    )
                  : MiraElevatedButton(
                      onTap: onTryAgain,
                      label: buttonLabel ?? 'حاول مرة أخرى',
                    ),
          ],
        ),
      ),
    );
  }
}
