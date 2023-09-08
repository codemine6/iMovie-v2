import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';
import 'package:imovie/features/movies/domain/repositories/movie_repository.dart';

class GetNowPlayingMoviesUseCase {
  final MovieRepository movieRepository;

  GetNowPlayingMoviesUseCase(this.movieRepository);

  Future<DataState<List<MovieEntity>>> call() {
    return movieRepository.getNowPlayingMovies();
  }
}
