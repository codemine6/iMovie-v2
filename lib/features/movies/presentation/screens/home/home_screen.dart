import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/features/movies/presentation/providers/movies/now_playing_movies_provider.dart';
import 'package:imovie/features/movies/presentation/providers/movies/popular_movies_provider.dart';
import 'package:imovie/features/movies/presentation/screens/home/widgets/trending.dart';
import 'package:imovie/features/movies/presentation/screens/search/search_screen.dart';
import 'package:imovie/features/movies/presentation/widgets/movie_card.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMoviesState = ref.watch(popularMoviesProvider);
    final nowPlayingMoviesState = ref.watch(nowPlayingMoviesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('iMovie'),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          GestureDetector(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Icon(
                    Ionicons.search,
                    size: 20,
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Find movies, shows, and more',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.tertiary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SearchScreen()),
              );
            },
          ),
          const SizedBox(height: 24),
          const Trending(),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              'Popular Movies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 170,
            child: popularMoviesState.when(
              data: (data) => ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MovieCard(movie: data.data![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 18),
                itemCount: data.data!.length,
              ),
              error: (error, stackTrace) => Text('Error'),
              loading: () => Text('Loading'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(18),
            child: Text(
              'Now Playing Movies',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 170,
            child: nowPlayingMoviesState.when(
              data: (data) => ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                itemBuilder: (context, index) {
                  return MovieCard(movie: data.data![index]);
                },
                separatorBuilder: (context, index) => const SizedBox(width: 18),
                itemCount: data.data!.length,
              ),
              error: (error, stackTrace) => Text('Error'),
              loading: () => Text('Loading'),
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
