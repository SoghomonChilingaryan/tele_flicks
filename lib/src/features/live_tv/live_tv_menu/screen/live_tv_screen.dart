import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/bloc/live_tv_menu_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/domain/live_categories.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/data/live_tv_menu_repository.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/bloc/live_tv_player_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/screen/live_tv_player_widget.dart';

class LiveTvMenuScreen extends StatefulWidget {
  const LiveTvMenuScreen({super.key});

  @override
  State<LiveTvMenuScreen> createState() => _LiveTvMenuScreenState();
}

class _LiveTvMenuScreenState extends State<LiveTvMenuScreen> {
  late final LiveTvPlayerBloc _liveTvPlayerBloc;
  late final LiveTvMenuBloc _liveTvMenuBloc;
  @override
  void initState() {
    _liveTvPlayerBloc = LiveTvPlayerBloc();
    _liveTvMenuBloc = LiveTvMenuBloc(
      progressBloc: context.read(),
      repository: getIt<LiveTvMenuRepository>(),
      liveTvPlayerBloc: _liveTvPlayerBloc,
    )..add(LiveTvMenuGetLiveCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _liveTvMenuBloc,
        ),
        BlocProvider(
          create: (context) => _liveTvPlayerBloc,
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisSize: MainAxisSize.min,
            children: [
              LiveTvPlayerWidget(),
              SizedBox(height: 20),
              Expanded(
                child: BlocBuilder<LiveTvMenuBloc, LiveTvMenuState>(
                  buildWhen: (previous, current) =>
                      current.category != previous.category,
                  builder: (context, state) {
                    // return SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.min,
                    //     // mainAxisAlignment: MainAxisAlignment.start,
                    //     // crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: state.category
                    //         .map((e) => CategoryWidget(categories: e))
                    //         .toList(),
                    //   ),
                    // );
                    return Align(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.category.length,
                        itemBuilder: (context, index) {
                          return CategoryWidget(
                            // liveTvMenuBloc: _liveTvMenuBloc,
                            categories: state.category[index],
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
              // Placeholder(),
              // Expanded(child: SizedBox()),
              // ListView.builder(
              //   // itemCount: state.category.length,
              //   itemBuilder: (context, index) {
              //     return SizedBox();
              //   },
              // ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final LiveCategories _categories;
  const CategoryWidget({
    super.key,
    required LiveCategories categories,
  }) : _categories = categories;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<LiveTvMenuBloc>()
          .add(LiveTvMenuOnCategoryPressEvent(_categories.categoryId)),
      child: Align(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
                offset: const Offset(-3, -3),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: Text(
            _categories.categoryName,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
