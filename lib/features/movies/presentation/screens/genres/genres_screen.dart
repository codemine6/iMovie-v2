import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/core/resources/genre.dart';
import 'package:imovie/features/movies/presentation/providers/movies/movies_genre_provider.dart';
import 'package:imovie/features/movies/presentation/providers/movies/movies_state.dart';
import 'package:imovie/features/movies/presentation/widgets/movie_card.dart';

class GenresScreen extends ConsumerStatefulWidget {
  const GenresScreen({super.key});

  @override
  ConsumerState<GenresScreen> createState() => _GenresScreenState();
}

class _GenresScreenState extends ConsumerState<GenresScreen> {
  final scrollController = ScrollController();
  final genres = Genre.genres;
  int currentId = 28;
  int currentPage = 1;
  bool loading = false;

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        setState(() {
          currentPage += 1;
          loading = true;
        });
        ref
            .read(moviesGenreProvider.notifier)
            .loadMoreData(currentId, currentPage + 1);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesState = ref.watch(moviesGenreProvider);
    ref.listen(moviesGenreProvider, (previous, next) {
      setState(() {
        loading = false;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Genres'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 18),
              itemBuilder: (context, index) {
                final genre = genres[index];

                return Material(
                  color: genre.id == currentId
                      ? Theme.of(context).colorScheme.primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(18),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        currentId = genre.id;
                        currentPage = 1;
                      });
                      ref
                          .read(moviesGenreProvider.notifier)
                          .getMoviesByGenre(genre.id, 1);
                    },
                    borderRadius: BorderRadius.circular(18),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(genre.name),
                      ),
                    ),
                  ),
                );
              },
              itemCount: genres.length,
            ),
          ),
          const SizedBox(height: 18),
          if (moviesState is MoviesLoaded)
            Expanded(
              child: GridView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(18),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: .7,
                ),
                itemBuilder: (context, index) {
                  return MovieCard(movie: moviesState.movies![index]);
                },
                itemCount: moviesState.movies!.length,
              ),
            ),
          if (loading)
            const Padding(
              padding: EdgeInsets.only(bottom: 18),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
