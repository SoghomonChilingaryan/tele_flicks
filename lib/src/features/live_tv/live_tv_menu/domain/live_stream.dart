

class LiveStream {
    final int num;
    final String name;
    // final String streamType;
    final int streamId;
    final String streamIcon;
    final dynamic epgChannelId;
    final String added;
    final String customSid;
    final int tvArchive;
    final String directSource;
    final int tvArchiveDuration;
    final String categoryId;
    final List<int> categoryIds;
    final String thumbnail;

    LiveStream({
        required this.num,
        required this.name,
        // required this.streamType,
        required this.streamId,
        required this.streamIcon,
        required this.epgChannelId,
        required this.added,
        required this.customSid,
        required this.tvArchive,
        required this.directSource,
        required this.tvArchiveDuration,
        required this.categoryId,
        required this.categoryIds,
        required this.thumbnail,
    });
}
