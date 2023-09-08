import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/domain/modules.dart';
import 'package:imovie/features/movies/presentation/providers/movies/movies_state.dart';

final moviesGenreProvider =
    StateNotifierProvider<MoviesGenre, MoviesState>((ref) => MoviesGenre(ref));

class MoviesGenre extends StateNotifier<MoviesState> {
  final Ref ref;

  MoviesGenre(this.ref) : super(const MoviesLoading()) {
    getMoviesByGenre(28, 1);
  }

  getMoviesByGenre(int id, int page) async {
    state = const MoviesLoading();
    final res = await ref.read(getMoviesByGenreUseCaseProvider).call(id, page);
    if (res is DataSuccess) {
      state = MoviesLoaded(res.data ?? []);
    } else {
      state = MoviesError(res.error ?? '');
    }
  }

  loadMoreData(int id, int page) async {
    final res = await ref.read(getMoviesByGenreUseCaseProvider).call(id, page);
    if (res is DataSuccess) {
      state = MoviesLoaded([...state.movies!, ...res.data!]);
    } else {
      state = MoviesError(res.error ?? '');
    }
  }
}
