import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';


class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upComingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final initalLoading = ref.watch(initialLoadingProvider);
    if (initalLoading) return const FullScreenLoader();

    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final upComingMovies = ref.watch(upComingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    // if (nowPlayingMovies.isEmpty) return const CircularProgressIndicator();

    return Visibility(
      visible: !initalLoading,
      child: CustomScrollView(slivers: [
        const SliverAppBar(
          floating: true,
          title: CustomAppbar(),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              // const CustomAppbar(),
              MoviesSlideshow(movies: moviesSlideshow),
              MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subTitle: 'Lunes 20',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }),
              MovieHorizontalListview(
                  movies: upComingMovies,
                  title: 'Proximamente',
                  subTitle: 'En este mes',
                  loadNextPage: () {
                    ref.read(upComingMoviesProvider.notifier).loadNextPage();
                  }),

              MovieHorizontalListview(
                  movies: topRatedMovies,
                  title: 'Mejor calificadas',
                  subTitle: 'Desde siempre',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  }),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }, childCount: 1))
      ]),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
