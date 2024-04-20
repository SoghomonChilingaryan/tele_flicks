import 'package:flutter/widgets.dart';

const double _buttonPressedOpacity = 0.65;
const double _buttonDisabledOpacity = 0.32;

class CupertinoButtonBehavior extends StatefulWidget {
  CupertinoButtonBehavior({
    required this.child,
    double? buttonDisabledOpacity,
    this.onPressed,
  }) : buttonDisabledOpacity = buttonDisabledOpacity ?? _buttonDisabledOpacity;

  final Widget child;
  final double buttonDisabledOpacity;
  final VoidCallback? onPressed;

  bool get enabled => (onPressed != null);

  @override
  _CupertinoButtonBehaviorState createState() =>
      _CupertinoButtonBehaviorState();
}

class _CupertinoButtonBehaviorState extends State<CupertinoButtonBehavior>
    with SingleTickerProviderStateMixin {
  static const Duration fadeOutDuration = Duration(milliseconds: 10);
  static const Duration fadeInDuration = Duration(milliseconds: 100);

  final Tween<double> _opacityTween = Tween<double>(begin: 1.0);

  AnimationController? _animationController;
  late Animation<double> _opacityAnimation;

  bool _buttonHeldDown = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      value: 0.0,
      vsync: this,
    );
    _opacityAnimation = _animationController!
        .drive(CurveTween(curve: Curves.decelerate))
        .drive(_opacityTween);
    _setTween();
  }

  @override
  void didUpdateWidget(CupertinoButtonBehavior old) {
    super.didUpdateWidget(old);
    _setTween();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.enabled) {
      final animatedButton = FadeTransition(
        opacity: _opacityAnimation,
        child: widget.child,
      );

      return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTapDown: _onTapDown,
        onTapUp: _onTapUp,
        onTapCancel: _onTapCancel,
        onTap: widget.onPressed,
        child: animatedButton,
      );
    }

    return Opacity(
      opacity: widget.buttonDisabledOpacity,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    _animationController = null;
    super.dispose();
  }

  void _setTween() {
    _opacityTween.end = _buttonPressedOpacity;
  }

  void _onTapDown(TapDownDetails event) {
    if (!_buttonHeldDown) {
      _buttonHeldDown = true;
      _animate();
    }
  }

  void _onTapUp(TapUpDetails event) {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _onTapCancel() {
    if (_buttonHeldDown) {
      _buttonHeldDown = false;
      _animate();
    }
  }

  void _animate() {
    if (_animationController!.isAnimating) return;
    final wasHeldDown = _buttonHeldDown;
    final ticker = _buttonHeldDown
        ? _animationController!.animateTo(1.0, duration: fadeOutDuration)
        : _animationController!.animateTo(0.0, duration: fadeInDuration);
    ticker.then<void>((void value) {
      if (mounted && wasHeldDown != _buttonHeldDown) _animate();
    });
  }
}
