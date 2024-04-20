import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/common/local/generated/l10n.dart';
import 'package:tele_flicks/src/common/res/app_assets.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/common/widgets/buttons/mc_button.dart';
import 'package:tele_flicks/src/features/user_state/bloc/user_state_bloc.dart';
import 'package:tele_flicks/src/navigation/navigator/app_navigator.dart';
import 'package:tele_flicks/src/navigation/router/app_router.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final navigator = context.read<AppNavigator>();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: context.mediaQuery.size.height / 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _MenuWidget(
                text: S.of(context).liveTv,
                iconPath: AppAssets.menuLiveTv,
                onTap: () => navigator.pushNamed(AppRouter.liveTv),
              ),
              SizedBox(width: 20),
              _MenuWidget(
                text: S.of(context).movies,
                iconPath: AppAssets.menuMovies,
                onTap: () => navigator.pushNamed(AppRouter.movies),
              ),
            ],
          ),
          Spacer(),
          MCButton(
            bgColor: AppColors.primaryRed,
            text: S.of(context).logout,
            onPressed: () =>
                context.read<UserStateBloc>().add(UserStateLogOutEvent()),
          ),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _MenuWidget extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  const _MenuWidget({
    required this.text,
    required this.iconPath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final width = context.mediaQuery.size.width / 2.7;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: context.theme.brightness == Brightness.light
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
        child: Stack(
          children: [
            Image.asset(iconPath),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  color: context.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
