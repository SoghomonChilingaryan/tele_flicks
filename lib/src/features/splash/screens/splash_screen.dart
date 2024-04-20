import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/app/app.dart';
import 'package:tele_flicks/src/common/widgets/splash_widgets/initial_splash_widget.dart';
import 'package:tele_flicks/src/features/splash/bloc/splash_bloc.dart';

class SplashScreen extends StatefulWidget {
  // final Widget child;
  const SplashScreen({
    super.key,
    // required this.child,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc _bloc;
  @override
  void initState() {
    _bloc = SplashBloc()..add(SplashAddDependenciesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(
      bloc: _bloc,
      builder: (context, state) {
        switch (state) {
          case SplashInitialState():
            return SplashWidget();
          case SplashAddedDependenciesState():
            return App();
        }
      },
    );
  }
}
