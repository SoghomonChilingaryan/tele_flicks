import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/features/app_progress/app_progress_bloc.dart';

class ProgressWidget extends StatefulWidget {
  final Widget child;
  final GlobalKey<NavigatorState>? navigatorKey;

  ProgressWidget({
    super.key,
    required this.child,
    this.navigatorKey,
  });

  @override
  _ProgressWidgetState createState() => _ProgressWidgetState();
}

class _ProgressWidgetState<C extends BlocBase<S>, S extends ProgressState>
    extends State<ProgressWidget> with TickerProviderStateMixin {
  OverlayEntry? progressOverlayEntry;
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppProgressBloc(),
      child: PopScope(
        canPop: progressOverlayEntry == null,
        child: BlocListener<AppProgressBloc, AppProgressState>(
          listener: (context, state) {
            if (state.inProgress) {
              context.hideKeyboard();
              progressOverlayEntry ??= showProgress();
            } else {
              progressOverlayEntry?.remove();
              progressOverlayEntry = null;
              _animationController.reverse();
            }
          },
          child: widget.child,
        ),
      ),
    );
  }

  OverlayEntry showProgress() {
    final entry = OverlayEntry(
      builder: (context) => Container(
        alignment: Alignment.center,
        color: const Color(0x80000000),
        child: FadeTransition(
          opacity: animation,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
    widget.navigatorKey == null
        ? Overlay.of(context).insert(entry)
        : widget.navigatorKey!.currentState!.overlay!.insert(entry);
    _animationController.forward();
    return entry;
  }

  @override
  void dispose() {
    progressOverlayEntry?.remove();
    progressOverlayEntry = null;
    _animationController.dispose();
    super.dispose();
  }
}
