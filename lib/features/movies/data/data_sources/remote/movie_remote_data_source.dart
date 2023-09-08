import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<DataState<List<MovieModel>>> getMoviesByGenre(int id, int page);
  Future<DataState<List<MovieModel>>> getNowPlayingMovies();
  Future<DataState<List<MovieModel>>> getPopularMovies();
  Future<DataState<List<MovieModel>>> getTrendingMovies();
}
