import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/cubit/movie_cubit.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/screens/home_screen/widgets/categories_bar.dart';
import 'package:movie_app/screens/home_screen/widgets/genres_bar.dart';
import 'package:movie_app/screens/home_screen/widgets/movie_carousel.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/utilities/responsive_layout.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MovieCubit>(context).getMovies();
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return Scaffold(
      backgroundColor: themeColors.primary,
      appBar: AppBar(
        backgroundColor: themeColors.primary,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/menu.svg',
            width: 20,
            height: 20,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
              height: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoriesBar(),
            GenresBar(),
            const MoviewCarousel(),
          ],
        ),
      ),
    );
  }
}
