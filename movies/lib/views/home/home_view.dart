import 'package:carousel_slider/carousel_slider.dart';
import 'package:data/models/movie_model.dart';
import 'package:data/repositories/movies_repository_interface.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:movies/views/home/cubit/home_cubit.dart';
import 'package:movies/views/widgets/hero_dialog.dart';
import 'package:movies/views/widgets/movie_card.dart';
import 'package:movies/views/widgets/movie_details.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BlocProvider<HomeCubit>(
          create: (BuildContext context) => HomeCubit(
              GetIt.I<IMoviesRepository>(), GetIt.I<IStorageService>())
            ..loadMovies(),
          child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeSuccess) {
              return body();
            } else if (state is HomeFailure) {
              return _failure();
            } else {
              return _loading();
            }
          })),
    );
  }

  Center _loading() => Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );

  Center _failure() {
    return Center(
        child: Text(
      "Failure!",
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontWeight: FontWeight.bold, color: Colors.grey.shade50),
    ));
  }

  Widget body() {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return ListView(
          children: [
            _trending(
              state.nowPlayingMovies!,
            ),
            const SizedBox(
              height: 20,
            ),
            _movieList(state.popularMovies!, "Popular"),
            const SizedBox(
              height: 20,
            ),
            _movieList(state.topRatedMovies!, "Top rated"),
          ],
        );
      },
    );
  }

  Widget _trending(List<MovieModel> movies) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (cubitContext, state) {
        return Container(
          child: CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIdx) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MovieCard(
                    imageUrl: movies[index].backdropPath!,
                    id: (movies[index].id).toString() + "trending",
                    onTap: () {
                      var function = () {
                        cubitContext
                            .read<HomeCubit>()
                            .setFavorite(movies[index]);
                      };
                      _onTap(
                          (movies[index].id + movies[index + 1].id).toString(),
                          movies[index],
                          function);
                    },
                  ),
                );
              },
              options: CarouselOptions(
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
              )),
        );
      },
    );
  }

  Widget _movieList(List<MovieModel> movies, String title) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_title(title), _movies(movies, title)],
          ),
        );
      },
    );
  }

  Widget _movies(List<MovieModel> movies, String title) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Expanded(
          flex: 5,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: 10,
              itemBuilder: (context, index, realIdx) {
                var function = () {
                  context.read<HomeCubit>().setFavorite(movies[index]);
                };
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: MovieCard(
                    imageUrl: movies[index].backdropPath!,
                    id: movies[index].id.toString() + title,
                    onTap: () {
                      var movie = movies[index];
                      _onTap((movies[index].id).toString() + title,
                          movies[index], function);
                    },
                  ),
                );
              },
              options: CarouselOptions(
                viewportFraction: 0.5,
                autoPlay: false,
                initialPage: 0,
                disableCenter: true,
              ),
            ),
          ),
        );
      },
    );
  }

  Expanded _title(String title) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold, color: Colors.grey.shade50),
        ),
      ),
    );
  }

  void _onTap(String id, MovieModel movie, void Function() setFavorite) async {
    await Navigator.push(
      context,
      HeroDialogRoute(
        builder: (BuildContext context) {
          return MovieDetails(
              movie: movie, id: id, onFavoritePressed: setFavorite);
        },
      ),
    );
  }

//// DATA ///
}
