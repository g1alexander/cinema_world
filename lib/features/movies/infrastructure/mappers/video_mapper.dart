import 'package:cine_world/features/movies/infrastructure/models/models.dart';

class VideoMapper {
  static String idVideoToEntity(VideosResponse data) {
    final videos = data.results;

    if (videos.isEmpty) return '';

    final video = videos.lastWhere(
      (video) =>
          video.type == 'Trailer' && video.site == 'YouTube' && video.official,
      orElse: () => Result(
          iso6391: '',
          iso31661: '',
          name: '',
          key: '',
          site: '',
          size: 0,
          type: '',
          official: false,
          publishedAt: DateTime.now(),
          id: ''),
    );

    return video.key;
  }
}
