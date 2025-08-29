import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/providers.dart';

class FavortiesView extends ConsumerStatefulWidget {
  const FavortiesView({super.key});

  @override
  FavortiesViewState createState() => FavortiesViewState();
}

class FavortiesViewState extends ConsumerState<FavortiesView> with AutomaticKeepAliveClientMixin  {
  bool isLastPage = false;
  bool isLoading = false;
  @override
  void initState() {
    super.initState();

    ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();

    if (movies.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();

    if (favoriteMovies.isEmpty) {
      final colors = Theme.of(context).colorScheme;
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_outline_sharp, size: 60, color: colors.primary,),
            Text('Oh no!!', style: TextStyle(fontSize: 30, color: colors.primary),),
             Text('No hay nashes agregados como favos OwO', style: TextStyle(fontSize: 15, color: colors.secondary),),


             const SizedBox(height: 20,),
              FilledButton.tonal(onPressed: ()=> context.go('/home/0'),
               child: const Text('Vuelve a casa'))


          ],
        ),
      );
    }

    return MovieMasonry(loadNextPage: loadNextPage, movies: favoriteMovies);
  }

  @override
  bool get wantKeepAlive => true;
}
