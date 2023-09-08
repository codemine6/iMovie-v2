import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int? id;
  final String? backdropPath;
  final List<String>? genres;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final double? voteAverage;

  const MovieEntity({
    this.id,
    this.backdropPath,
    this.genres,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        genres,
        posterPath,
        releaseDate,
        title,
        voteAverage,
      ];
}
