import 'package:equatable/equatable.dart';
import 'package:imovie/features/movies/domain/entities/movie_entity.dart';

abstract class MoviesState extends Equatable {
  final List<MovieEntity>? movies;
  final String? error;

  const MoviesState({this.movies, this.error});

  @override
  List<Object?> get props => [movies, error];
}

class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

class MoviesLoaded extends MoviesState {
  const MoviesLoaded(List<MovieEntity> movies) : super(movies: movies);
}

class MoviesError extends MoviesState {
  const MoviesError(String error) : super(error: error);
}
