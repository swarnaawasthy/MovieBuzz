import 'package:moviemuse/features/homepage/data/tv_show_repository.dart';
import 'package:moviemuse/features/homepage/domain/tv_show_entity.dart';

class GetTVShows {
  final TVShowRepository repository;

  GetTVShows(this.repository);
  Future<List<TVShowEntity>> call() async {
    final tvShows = await repository.fetchTVShows();
    return tvShows
        .map((model) => TVShowEntity(
              id: model?.id,
              name: model.name,
              imageThumbnailPath: model.imageThumbnailPath,
            ))
        .toList();
  }
}
