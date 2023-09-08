import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/features/movies/data/modules.dart';
import 'package:imovie/features/movies/domain/usecases/movie/get_movies_by_genre_usecase.dart';
import 'package:imovie/features/movies/domain/usecases/movie/get_now_playing_movies_usecase.dart';
import 'package:imovie/features/movies/domain/usecases/movie/get_popular_movies_usecase.dart';
import 'package:imovie/features/movies/domain/usecases/movie/get_trending_movies_usecase.dart';

final getMoviesByGenreUseCaseProvider = Provider(
    (ref) => GetMoviesByGenreUseCase(ref.read(movieRepositoryProvider)));
final getNowPlayingMoviesUseCaseProvider = Provider(
    (ref) => GetNowPlayingMoviesUseCase(ref.read(movieRepositoryProvider)));
final getPopularMoviesUseCaseProvider = Provider(
    (ref) => GetPopularMoviesUseCase(ref.read(movieRepositoryProvider)));
final getTrendingMoviesUseCaseProvider = Provider(
    (ref) => GetTrendingMoviesUseCase(ref.read(movieRepositoryProvider)));
