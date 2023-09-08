import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/features/movies/domain/modules.dart';

final trendingMoviesProvider =
    FutureProvider((ref) => ref.read(getTrendingMoviesUseCaseProvider).call());
