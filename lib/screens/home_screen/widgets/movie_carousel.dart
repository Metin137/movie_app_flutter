import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/screens/detail_screen/detail_screen.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/utilities/responsive_layout.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:movie_app/route/route.dart' as route;

class MoviewCarousel extends StatefulWidget {
  const MoviewCarousel({Key? key}) : super(key: key);

  @override
  State<MoviewCarousel> createState() => _MoviewCarouselState();
}

class _MoviewCarouselState extends State<MoviewCarousel> {
  late PageController _pageController;
  int initialPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: AspectRatio(
        aspectRatio: 0.9,
        child: BlocConsumer<MovieCubit, MovieState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is MovieLoaded) {
              return PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    initialPage = value;
                  });
                },
                physics: const ClampingScrollPhysics(),
                itemCount: state.movies!.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.all(10),
                  child: _buildMovieCard(movies: state.movies!, index: index),
                ),
              );
            }

            return Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  color: themeColors.secondary,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  AnimatedBuilder _buildMovieCard({required List<Movie> movies, required int index}) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!;
          value = (value * 0.038).clamp(-1, 1);
        }

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 350),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
            angle: math.pi * value,
            child: _MovieCard(movie: movies[index]),
          ),
        );
      },
    );
  }
}

class _MovieCard extends StatelessWidget {
  final Movie movie;

  const _MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Expanded(
            child: OpenContainer(
              openElevation: 0,
              closedElevation: 0,
              closedBuilder: (context, action) => buildCard(context),
              openBuilder: (context, action) => DetailScreen(movie: moviess[0]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
            child: Text(
              movie.title!,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/star_fill.svg'),
              const SizedBox(width: kDefaultPadding / 2),
              Text(
                '${movie.imDbRating}',
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [kDefaultShadow],
        image: DecorationImage(
          image: NetworkImage(movie.image!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
