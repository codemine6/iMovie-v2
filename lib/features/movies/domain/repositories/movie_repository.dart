import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<DataState<List<MovieEntity>>> getMoviesByGenre(int id, int page);
  Future<DataState<List<MovieEntity>>> getNowPlayingMovies();
  Future<DataState<List<MovieEntity>>> getPopularMovies();
  Future<DataState<List<MovieEntity>>> getTrendingMovies();
}
