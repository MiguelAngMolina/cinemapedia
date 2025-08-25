import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class FavortiesView extends ConsumerStatefulWidget {
  const FavortiesView({super.key});

  @override
  FavortiesViewState createState() => FavortiesViewState();
}

class FavortiesViewState extends ConsumerState<FavortiesView> {
  @override
  void initState() {
    super.initState();

    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    return MovieMasonry(movies: favoriteMovies);
  }
}
