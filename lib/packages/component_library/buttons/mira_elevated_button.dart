import 'package:flutter/material.dart';
import 'package:mira/packages/component_library/theme/theme.dart';

const double elevatedButtonHeight = 37;

class MiraElevatedButton extends StatelessWidget {
  const MiraElevatedButton({
    required this.label,
    required this.onTap,
    this.icon,
    this.height,
    this.width,
    this.borderRadius,
    this.labelColor = Colors.white,
    this.bgColor,
    this.borderColor = Colors.transparent,
    this.iconAlignment = IconAlignment.start,
    super.key,
  });

  MiraElevatedButton.inProgress({
    required String label,
    double? width,
    double? height,
    double? borderRadius,
    IconAlignment iconAlignment = IconAlignment.start,
    Key? key,
  }) : this(
          iconAlignment: iconAlignment,
          label: label,
          width: width,
          onTap: null,
          height: height,
          labelColor: Colors.black,
          borderRadius: borderRadius,
          icon: Transform.scale(
            scale: 0.4,
            child: const CircularProgressIndicator(),
          ),
          key: key,
        );

  final VoidCallback? onTap;
  final String label;
  final Widget? icon;
  final Color? labelColor;
  final Color? bgColor;
  final Color borderColor;
  final double? height;
  final double? width;
  final double? borderRadius;
  final IconAlignment iconAlignment;

  @override
  Widget build(BuildContext context) {
    final colorScheme =
        MiraTheme.of(context).materialThemeData.colorScheme;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = MiraTheme.of(context);
    final textTheme = Theme.of(context).textTheme;

    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: bgColor ?? colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? theme.elevatedButtonBorderRadius,
        ),
        side: BorderSide(color: borderColor),
      ),
    );
    return SizedBox(
      height: height ?? elevatedButtonHeight,
      width: width ?? screenWidth,
      child: icon != null
          ? ElevatedButton.icon(
              style: buttonStyle,
              onPressed: onTap,
              iconAlignment: iconAlignment,
              label: Text(
                label,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
              icon: icon!,
            )
          : ElevatedButton(
              style: buttonStyle,
              onPressed: onTap,
              child: Text(
                label,
                style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w500,
                  color: labelColor,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
    );
  }
}
