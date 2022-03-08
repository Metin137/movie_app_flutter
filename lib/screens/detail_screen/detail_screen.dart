import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/screens/detail_screen/widgets/backdrop_rating.dart';
import 'package:movie_app/screens/detail_screen/widgets/cast_section.dart';
import 'package:movie_app/screens/detail_screen/widgets/info_section.dart';
import 'package:movie_app/screens/detail_screen/widgets/title_section.dart';
import 'package:movie_app/screens/home_screen/widgets/genres_bar.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/widgets/scrollable_layout.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final Movie movie;
  const DetailScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;
    Size size = MediaQuery.of(context).size;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: ScrollableLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BackdropRating(movie: movie),
              TitleSection(movie: movie),
              GenresBar(pressable: false, genres: movie.genres ?? []),
              InfoSection(movie: movie),
              CastSection(movie: movie),
            ],
          ),
        ),
      ),
    );
  }
}
