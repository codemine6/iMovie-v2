import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';
import 'package:imovie/features/movies/domain/repositories/movie_repository.dart';

class GetPopularMoviesUseCase {
  final MovieRepository movieRepository;

  GetPopularMoviesUseCase(this.movieRepository);

  Future<DataState<List<MovieEntity>>> call() {
    return movieRepository.getPopularMovies();
  }
}
