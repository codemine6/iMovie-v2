import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';
import 'package:imovie/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource movieRemoteDataSource;

  MovieRepositoryImpl(this.movieRemoteDataSource);

  @override
  Future<DataState<List<MovieEntity>>> getMoviesByGenre(int id, int page) {
    return movieRemoteDataSource.getMoviesByGenre(id, page);
  }

  @override
  Future<DataState<List<MovieEntity>>> getNowPlayingMovies() {
    return movieRemoteDataSource.getNowPlayingMovies();
  }

  @override
  Future<DataState<List<MovieEntity>>> getPopularMovies() {
    return movieRemoteDataSource.getPopularMovies();
  }

  @override
  Future<DataState<List<MovieEntity>>> getTrendingMovies() {
    return movieRemoteDataSource.getTrendingMovies();
  }
}
