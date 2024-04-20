import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/features/app_progress/progress_widget.dart';
import 'package:tele_flicks/src/features/user_state/bloc/user_state_bloc.dart';
import 'package:tele_flicks/src/navigation/navigator/app_navigator.dart';
import 'package:tele_flicks/src/navigation/router/app_router.dart';
import 'package:tele_flicks/src/navigation/router/login_router.dart';
import 'package:provider/provider.dart';

class UserStateListener extends StatelessWidget {
  const UserStateListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserStateBloc, UserStateState>(
      builder: (context, state) {
        switch (state) {
          case UserUnAuthorizedState():
            return UnAuthorizedScop();
          case UserAuthorizedState():
            return AuthorizedScop();
        }
      },
    );
  }
}

class UnAuthorizedScop extends StatelessWidget {
  const UnAuthorizedScop({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRouter = LoginRouter();
    return ProgressWidget(
      navigatorKey: LoginRouter.navigatorKey,
      child: MultiBlocProvider(
        providers: [
          Provider(create: (_) => AppNavigator(LoginRouter.navigatorKey)),
        ],
        child: Router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          routeInformationProvider: loginRouter.router.routeInformationProvider,
          routeInformationParser: loginRouter.router.routeInformationParser,
          routerDelegate: loginRouter.router.routerDelegate,
        ),
      ),
    );
  }
}

class AuthorizedScop extends StatelessWidget {
  const AuthorizedScop({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return ProgressWidget(
      navigatorKey: AppRouter.navigatorKey,
      child: MultiBlocProvider(
        providers: [
          Provider(create: (_) => AppNavigator(AppRouter.navigatorKey)),
        ],
        child: Router(
          backButtonDispatcher: RootBackButtonDispatcher(),
          routeInformationProvider: appRouter.router.routeInformationProvider,
          routeInformationParser: appRouter.router.routeInformationParser,
          routerDelegate: appRouter.router.routerDelegate,
        ),
      ),
    );
  }
}
