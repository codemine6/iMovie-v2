import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/core/providers/dio_provider.dart';
import 'package:imovie/features/movies/data/data_sources/remote/movie_remote_data_source_impl.dart';
import 'package:imovie/features/movies/data/repositories/movie_repository_impl.dart';

final movieRemoteDataSourceProvider =
    Provider((ref) => MovieRemoteDataSourceImpl(ref.read(dioProvider)));
final movieRepositoryProvider = Provider(
    (ref) => MovieRepositoryImpl(ref.read(movieRemoteDataSourceProvider)));
