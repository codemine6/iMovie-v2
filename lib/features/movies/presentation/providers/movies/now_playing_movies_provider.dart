import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/features/movies/domain/modules.dart';

final nowPlayingMoviesProvider = FutureProvider(
    (ref) => ref.read(getNowPlayingMoviesUseCaseProvider).call());
