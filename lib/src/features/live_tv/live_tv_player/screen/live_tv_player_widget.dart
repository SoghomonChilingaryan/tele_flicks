import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';
import 'package:tele_flicks/src/common/local/generated/l10n.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_player/bloc/live_tv_player_bloc.dart';
import 'package:video_player/video_player.dart';

class LiveTvPlayerWidget extends StatelessWidget {
  const LiveTvPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.mediaQuery.size.height / 2.7,
      child: BlocBuilder<LiveTvPlayerBloc, LiveTvPlayerState>(
        builder: (context, state) {
          return Center(
            child: switch (state) {
              LiveTvPlayerInitialState() => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).loading),
                  ],
                ),
              LiveTvPlayerHaveControllerState() => _ChewieWidget(
                  videoPlayerController: state.controller,
                ),
            },
          );
        },
      ),
    );
  }
}

class _ChewieWidget extends StatefulWidget {
  final VideoPlayerController _videoPlayerController;
  const _ChewieWidget({
    required VideoPlayerController videoPlayerController,
  }) : _videoPlayerController = videoPlayerController;

  @override
  State<_ChewieWidget> createState() => _ChewieWidgetState();
}

class _ChewieWidgetState extends State<_ChewieWidget> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget._videoPlayerController,
      autoPlay: true,
      looping: true,
      hideControlsTimer: const Duration(seconds: 2),
      additionalOptions: (context) {
        return <OptionItem>[
          OptionItem(
            onTap: () {},
            iconData: Icons.live_tv_sharp,
            title: 'Toggle Video Src',
          ),
        ];
      },
      materialProgressColors: ChewieProgressColors(
        playedColor: AppColors.primary,
        handleColor: AppColors.primary,
        backgroundColor: Colors.grey,
        bufferedColor: AppColors.bufferedColor,
      ),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
