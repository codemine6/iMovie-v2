import 'package:dio/dio.dart';
import 'package:imovie/core/resources/data_state.dart';
import 'package:imovie/features/movies/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:imovie/features/movies/data/models/movie_model.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(this.dio);

  @override
  Future<DataState<List<MovieModel>>> getMoviesByGenre(int id, int page) async {
    try {
      final res = await dio.get('/discover/movie?with_genres=$id&page=$page');
      final results = res.data['results'] as List;
      final data = results.map((e) => MovieModel.fromJson(e)).toList();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed('');
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getNowPlayingMovies() async {
    try {
      final res = await dio.get('/movie/now_playing');
      final results = res.data['results'] as List;
      final data = results.map((e) => MovieModel.fromJson(e)).toList();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed('');
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getPopularMovies() async {
    try {
      final res = await dio.get('/movie/popular');
      final results = res.data['results'] as List;
      final data = results.map((e) => MovieModel.fromJson(e)).toList();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed('');
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getTrendingMovies() async {
    try {
      final res = await dio.get('/trending/movie/day');
      final results = res.data['results'] as List;
      final data = results.map((e) => MovieModel.fromJson(e)).toList();
      return DataSuccess(data);
    } catch (e) {
      return DataFailed('');
    }
  }
}
