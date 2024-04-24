import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tele_flicks/src/common/res/app_colors.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/bloc/live_tv_menu_bloc.dart';
import 'package:tele_flicks/src/features/live_tv/live_tv_menu/domain/live_stream.dart';

class LiveStreamWidget extends StatelessWidget {
  final LiveStream _liveStream;
  const LiveStreamWidget({
    super.key,
    required LiveStream liveStream,
  }) : _liveStream = liveStream;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.35;
    final height = width * 0.55;
    return GestureDetector(
      onTap: () => context
          .read<LiveTvMenuBloc>()
          .add(LiveTvMenuOnLiveStreamPressEvent(_liveStream.streamId)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.primaryCard,
          ),
          child: Row(
            children: [
              Flexible(
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: _liveStream.streamIcon,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => Container(
                          color: Colors.black.withOpacity(0.5),
                          child: Icon(Icons.photo, color: Colors.white),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20),
              Flexible(
                child: Text(
                  _liveStream.name,
                  style: TextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

