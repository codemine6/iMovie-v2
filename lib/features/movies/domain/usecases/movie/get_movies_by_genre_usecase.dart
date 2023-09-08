import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';
import 'package:imovie/features/movies/domain/repositories/movie_repository.dart';

class GetMoviesByGenreUseCase {
  final MovieRepository movieRepository;

  GetMoviesByGenreUseCase(this.movieRepository);

  Future<DataState<List<MovieEntity>>> call(int id, int page) {
    return movieRepository.getMoviesByGenre(id, page);
  }
}
