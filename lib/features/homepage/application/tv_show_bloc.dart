import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemuse/features/homepage/domain/get_tv_show.dart';
import 'package:moviemuse/features/homepage/domain/tv_show_entity.dart';

class TVShowState {
  final List<TVShowEntity>? shows;
  final TVShowEntity? selectedShow;

  TVShowState({this.shows, this.selectedShow});
}

class TVShowBloc extends Cubit<TVShowState> {
  final GetTVShows getTVShows;

  TVShowBloc(this.getTVShows) : super(TVShowState());

  void loadTVShows() async {
    final shows = await getTVShows();
    emit(TVShowState(shows: shows));
  }

  void selectShow(TVShowEntity show) {
    emit(TVShowState(shows: state.shows, selectedShow: show));
  }
}
