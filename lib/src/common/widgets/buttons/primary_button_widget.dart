import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;
  final double? size;
  final double? borderRadius;

  const PrimaryButtonWidget({
    super.key,
    required this.onPressed,
    required this.child,
    this.size,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Center(
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: borderRadius != null
                ? BorderRadius.circular(borderRadius!)
                : BorderRadius.circular(60),
            boxShadow: [
              BoxShadow(
                color: theme.brightness == Brightness.light
                    ? AppColors.shadowWight
                    : AppColors.shadowDark,
                blurRadius: 3,
                offset: const Offset(-3, -3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.9),
                blurRadius: 3,
                offset: const Offset(5, 5),
              ),
            ],
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
