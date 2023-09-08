import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/features/movies/domain/modules.dart';

final popularMoviesProvider =
    FutureProvider((ref) => ref.read(getPopularMoviesUseCaseProvider).call());
