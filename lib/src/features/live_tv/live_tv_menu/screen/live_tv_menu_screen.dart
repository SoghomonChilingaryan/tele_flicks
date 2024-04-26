import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/core/di/di_setup.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/bloc/live_tv_menu_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/data/live_tv_menu_repository.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/widgets/category_widget.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/widgets/live_stream_widget.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/bloc/live_tv_player_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/screen/live_tv_player_widget.dart';

class LiveTvScreen extends StatefulWidget {
  const LiveTvScreen({super.key});

  @override
  State<LiveTvScreen> createState() => _LiveTvScreenState();
}

class _LiveTvScreenState extends State<LiveTvScreen> {
  late final LiveTvPlayerBloc _liveTvPlayerBloc;
  late final LiveTvMenuBloc _liveTvMenuBloc;

  @override
  void initState() {
    _liveTvPlayerBloc = LiveTvPlayerBloc();
    _liveTvMenuBloc = LiveTvMenuBloc(
      progressBloc: context.read(),
      repository: getIt<LiveTvMenuRepository>(),
      liveTvPlayerBloc: _liveTvPlayerBloc,
    )..add(LiveTvMenuCreateInitialStateEvent());
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
            mainAxisSize: MainAxisSize.min,
            children: [
              LiveTvPlayerWidget(),
              _LiveTvMenuWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _LiveTvMenuWidget extends StatelessWidget {
  const _LiveTvMenuWidget();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          BlocBuilder<LiveTvMenuBloc, LiveTvMenuState>(
            buildWhen: (p, c) =>
                c.category != p.category ||
                c.currantCategoryId != p.currantCategoryId,
            builder: (context, state) {
              return Align(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: state.category
                        .map((e) => CategoryWidget(
                              categories: e,
                              isChosen: e.categoryId == state.currantCategoryId,
                            ))
                        .toList(),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          Expanded(
            child: BlocBuilder<LiveTvMenuBloc, LiveTvMenuState>(
              buildWhen: (p, c) => c.liveStreams != p.liveStreams,
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.liveStreams.length,
                  itemBuilder: (context, index) {
                    final liveStream = state.liveStreams[index];
                    return LiveStreamWidget(
                      liveStream: liveStream,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
