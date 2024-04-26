import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/bloc/live_tv_menu_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/domain/live_categories.dart';

class CategoryWidget extends StatelessWidget {
  final LiveCategories _categories;
  final bool _isChosen;
  const CategoryWidget({
    super.key,
    required LiveCategories categories,
    required bool isChosen,
  })  : _categories = categories,
        _isChosen = isChosen;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<LiveTvMenuBloc>()
          .add(LiveTvMenuOnCategoryPressEvent(_categories.categoryId)),
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _isChosen
              ? context.primaryColor
              : context.theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowGrey.withOpacity(0.5),
              blurRadius: 3,
              offset: const Offset(-2, -2),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 3,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          _categories.categoryName,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
