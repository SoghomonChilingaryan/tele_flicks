import 'package:flutter/material.dart';
import 'package:tele_flicks/src/common/extinction/build_context.dart';

class LiveTvPlayerWidget extends StatelessWidget {
  const LiveTvPlayerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.mediaQuery.size.height / 3;
    return SizedBox(
      height: height,
      child: const Placeholder(),
    );
  }
}
