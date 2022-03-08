import 'package:flutter/material.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/utilities/responsive_layout.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenresBar extends StatefulWidget {
  final bool pressable;
  List<String> genres;
  GenresBar({Key? key, this.pressable = true, this.genres = dumpGenres}) : super(key: key);
  static const List<String> dumpGenres = [
    'Action',
    'Crime',
    'Comedy',
    'Drama',
    'Horror',
    'Action',
    'Crime',
    'Comedy',
    'Drama',
    'Horror'
  ];

  @override
  State<GenresBar> createState() => _GenresBarState();
}

class _GenresBarState extends State<GenresBar> {
  late List<String> genres;
  int selectedGenre = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      genres = widget.genres;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return Container(
      height: 36,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: kDefaultPadding / 2),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) => buildGenres(index, context, themeColors),
      ),
    );
  }

  GestureDetector buildGenres(int index, BuildContext context, ThemeColors themeColors) {
    return GestureDetector(
      onTap: () => widget.pressable
          ? setState(() {
              selectedGenre = index;
            })
          : {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              border: Border.all(
                color: themeColors.gray!,
                width: 1,
              ),
            ),
            child: Text(
              genres[index],
              style: TextStyle(
                color: (index == selectedGenre || !widget.pressable) ? themeColors.secondary : Colors.black.withOpacity(0.4),
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
