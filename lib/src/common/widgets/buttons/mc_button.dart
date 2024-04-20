import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/common/widgets/buttons/cupertino_button_behavior.dart';

class MCButton extends StatelessWidget {
  static const double defaultButtonWidth = 220;

  final String text;
  final double width;
  final double? height;
  final Color? bgColor;
  final Gradient? bgGradient;
  final Color? textColor;
  final BoxShadow? shadow;
  final double buttonDisabledOpacity;
  final VoidCallback? onPressed;

  MCButton({
    required this.text,
    this.width = defaultButtonWidth,
    this.height,
    this.bgColor,
    this.bgGradient,
    this.textColor,
    this.shadow,
    this.onPressed,
    double? buttonDisabledOpacity,
  }) : buttonDisabledOpacity = buttonDisabledOpacity ?? 0.64;

  @override
  Widget build(BuildContext context) {
    final button = DecoratedBox(
      decoration: ShapeDecoration(
        color: bgColor ?? context.theme.colorScheme.primary,
        gradient: bgGradient,
        shape: const StadiumBorder(),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: width,
          maxWidth: width,
          minHeight: 48,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
            child: FittedBox(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );

    return UnconstrainedBox(
      child: CupertinoButtonBehavior(
        buttonDisabledOpacity: buttonDisabledOpacity,
        onPressed: onPressed,
        child: button,
      ),
    );
  }
}
