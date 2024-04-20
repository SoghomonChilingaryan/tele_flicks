import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/res/app_assets.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';

const double _circleSize = 250;

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
    with SingleTickerProviderStateMixin<SplashWidget> {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkBackground,
      alignment: Alignment.center,
      child: FadeTransition(
        opacity: _animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: _circleSize,
                  height: _circleSize,
                  decoration: BoxDecoration(
                    color: AppColors.darkBackground,
                    borderRadius: BorderRadius.circular(_circleSize / 2),
                  ),
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    color:  AppColors.darkPrimary,
                  ),
                ),
                Image.asset(
                  AppAssets.teleFlicksLogo,
                  width: _circleSize,
                  height: _circleSize,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
