import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:imovie/core/constants/constants.dart';
import 'package:imovie/features/movies/presentation/providers/movies/trending_movies_provider.dart';
import 'package:ionicons/ionicons.dart';

class Trending extends ConsumerWidget {
  const Trending({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trendingMoviesState = ref.watch(trendingMoviesProvider);

    return trendingMoviesState.when(
      data: (data) => CarouselSlider.builder(
        itemCount: data.data!.length,
        itemBuilder: (context, index, realIndex) {
          final movie = data.data![index];
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                AspectRatio(
                  aspectRatio: 1.5,
                  child: Image.network(
                    imageUrl + (movie.backdropPath ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.7),
                        Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.8),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Icon(
                            Ionicons.star,
                            size: 20,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            movie.voteAverage?.toStringAsFixed(1) ?? '',
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          aspectRatio: 1.66,
          viewportFraction: .9,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 10),
          enlargeCenterPage: true,
        ),
      ),
      error: (error, stackTrace) => Text('Error'),
      loading: () => Text('Loading..'),
    );
  }
}
